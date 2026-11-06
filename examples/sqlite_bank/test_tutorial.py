"""Tests run only against disposable synthetic databases; never Oracle."""

from contextlib import redirect_stdout
import io
from pathlib import Path
import sqlite3
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

import tutorial


class TutorialTests(unittest.TestCase):
    def setUp(self):
        self.context = tutorial.database()
        self.connection = self.context.__enter__()
        self.addCleanup(self.context.__exit__, None, None, None)

    def query(self, sql):
        return tutorial.run_query(self.connection, sql)

    def test_all_lesson_results_are_exact(self):
        for lesson in tutorial.LESSONS:
            with self.subTest(lesson=lesson.key):
                self.assertEqual(self.query(lesson.sql), lesson.expected)

    def test_joint_ownership_traps_have_different_wrong_totals(self):
        joined = self.query("SELECT SUM(a.balance_pence) FROM account a "
                            "JOIN customer_account ca ON ca.account_id = a.account_id")
        distinct = self.query("SELECT SUM(DISTINCT balance_pence) FROM account")
        self.assertEqual(joined.rows, ((515000,),))
        self.assertEqual(distinct.rows, ((265000,),))

    def test_zero_branch_count_star_trap(self):
        result = self.query("SELECT COUNT(*) FROM branch b LEFT JOIN account a "
                            "ON a.branch_id = b.branch_id WHERE b.branch_id = 'B03'")
        self.assertEqual(result.rows, ((1,),))

    def test_fixtures_have_expected_table_sizes(self):
        expected = {"branch": 3, "customer": 4, "account": 5, "customer_account": 6,
                    "customer_phone": 5, "employee": 4}
        for table, count in expected.items():
            with self.subTest(table=table):
                self.assertEqual(self.query(f"SELECT COUNT(*) FROM {table}").rows, ((count,),))

    def test_phone_leading_zero_and_integer_money(self):
        self.assertEqual(self.query("SELECT phone FROM customer_phone "
                                    "WHERE customer_id = 'C01' AND label = 'mobile'").rows,
                         (("07700900001",),))
        self.assertEqual(self.query("SELECT DISTINCT typeof(balance_pence) FROM account").rows,
                         (("integer",),))

    def test_statements_cannot_mutate_or_escape(self):
        statements = (
            "DELETE FROM account", "UPDATE account SET balance_pence = 0",
            "INSERT INTO branch VALUES ('X', 'X')", "DROP TABLE account",
            "CREATE TABLE new_table (id INTEGER)", "ALTER TABLE branch ADD COLUMN x TEXT",
            "ATTACH DATABASE ':memory:' AS another", "DETACH DATABASE main",
            "PRAGMA query_only = OFF", "PRAGMA database_list", "VACUUM",
            "BEGIN", "SAVEPOINT example", "SELECT load_extension('not-a-library')",
            "SELECT randomblob(1000000000)", "SELECT readfile('private.txt')",
            "SELECT * FROM sqlite_master", "SELECT COUNT(*) FROM sqlite_master",
            "SELECT COUNT(*) FROM SQLITE_SCHEMA", "SELECT * FROM pragma_database_list",
            "SELECT * FROM pragma_table_info('account')", "SELECT * FROM dbstat",
        )
        for sql in statements:
            with self.subTest(sql=sql), self.assertRaises(sqlite3.Error):
                self.query(sql)
        self.assertEqual(self.query("SELECT SUM(balance_pence) FROM account").rows, ((390000,),))

    def test_rejects_multiple_statements(self):
        with self.assertRaises(sqlite3.Error):
            self.query("SELECT 1; SELECT 2;")

    def test_rejects_empty_or_oversized_query(self):
        for sql in ("  ", "SELECT '" + "界" * 4000 + "'"):
            with self.subTest(length=len(sql)), self.assertRaises(ValueError):
                self.query(sql)

    def test_row_limit_and_recovery(self):
        with self.assertRaisesRegex(ValueError, "More than 100 rows"):
            self.query("SELECT a.account_id FROM account a, account b, account c")
        self.assertEqual(self.query("SELECT 1 AS ok").rows, ((1,),))

    def test_instruction_budget_and_recovery(self):
        with self.assertRaisesRegex(sqlite3.OperationalError, "interrupted"):
            self.query("WITH RECURSIVE n(x) AS (SELECT 1 UNION ALL SELECT x + 1 FROM n) "
                       "SELECT SUM(x) FROM n")
        self.assertEqual(self.query("SELECT 2 AS ok").rows, ((2,),))

    def test_syntax_error_does_not_poison_session(self):
        with self.assertRaises(sqlite3.Error):
            self.query("SELEC bad")
        self.assertEqual(self.query("SELECT 3 AS ok").rows, ((3,),))

    def test_limited_recursive_select_is_supported(self):
        self.assertEqual(self.query("WITH RECURSIVE n(x) AS "
                                    "(SELECT 1 UNION ALL SELECT x + 1 FROM n WHERE x < 3) "
                                    "SELECT x FROM n ORDER BY x").rows, ((1,), (2,), (3,)))

    def test_count_over_cte_and_derived_tables(self):
        queries = (
            ("WITH n(x) AS (SELECT 1) SELECT COUNT(*) FROM n", 1),
            ("WITH RECURSIVE n(x) AS (SELECT 1 UNION ALL SELECT x + 1 FROM n WHERE x < 3) "
             "SELECT COUNT(*) FROM n", 3),
            ("SELECT COUNT(*) FROM (SELECT account_id FROM account)", 5),
        )
        for sql, count in queries:
            with self.subTest(sql=sql):
                self.assertEqual(self.query(sql).rows, ((count,),))

    def test_format_empty_and_null(self):
        self.assertIn("(0 rows)", tutorial.format_result(self.query("SELECT 1 WHERE 0")))
        self.assertIn("NULL", tutorial.format_result(self.query("SELECT NULL AS missing")))

    def test_fresh_sessions_are_reproducible_and_memory_only(self):
        with tutorial.database() as other:
            self.assertEqual(tutorial.run_query(other, tutorial.LESSONS[0].sql),
                             self.query(tutorial.LESSONS[0].sql))
            # Test-only inspection, after disabling the authorizer in this disposable DB.
            other.set_authorizer(lambda *args: sqlite3.SQLITE_OK)
            self.assertEqual(other.execute("PRAGMA database_list").fetchall(), [(0, "main", "")])
            self.assertEqual(other.execute("PRAGMA foreign_keys").fetchone(), (1,))
            self.assertEqual(other.execute("PRAGMA query_only").fetchone(), (1,))
            self.assertEqual(other.execute("PRAGMA foreign_key_check").fetchall(), [])

    def test_schema_enforces_relations_types_and_unique_ownership(self):
        # Test writes are confined to this test's fresh :memory: fixture.
        self.connection.set_authorizer(lambda *args: sqlite3.SQLITE_OK)
        self.connection.execute("PRAGMA query_only = OFF")
        bad_inserts = (
            "INSERT INTO account VALUES ('AX', 'missing', 'saving', 1)",
            "INSERT INTO account VALUES ('AX', 'B01', 'invalid', 1)",
            "INSERT INTO account VALUES ('AX', 'B01', 'saving', -1)",
            "INSERT INTO account VALUES ('AX', 'B01', 'saving', 1.5)",
            "INSERT INTO customer_account VALUES ('C01', 'A01')",
            "INSERT INTO employee VALUES ('EX', 'Demo', 'B01', 'EX')",
        )
        for sql in bad_inserts:
            with self.subTest(sql=sql), self.assertRaises(sqlite3.IntegrityError):
                self.connection.execute(sql)


class InterfaceTests(unittest.TestCase):
    def call(self, args, inputs=None):
        output = io.StringIO()
        with redirect_stdout(output), patch("builtins.input", side_effect=inputs or []):
            status = tutorial.main(args)
        return status, output.getvalue()

    def test_default_and_all_are_identical(self):
        self.assertEqual(self.call([]), self.call(["--all"]))

    def test_list_and_single_lesson(self):
        status, output = self.call(["--list"])
        self.assertEqual(status, 0)
        self.assertEqual(len(output.strip().splitlines()), 5)
        status, output = self.call(["--lesson", "ownership"])
        self.assertEqual(status, 0)
        self.assertIn("390000", output)
        self.assertNotIn("[counts]", output)

    def test_cli_errors_are_nonzero(self):
        for query in ("", "DROP TABLE account", "SELECT nope", "SELECT 1; SELECT 2;"):
            with self.subTest(query=query):
                status, output = self.call(["--query", query])
                self.assertEqual(status, 1)
                self.assertIn("Error:", output)

    def test_interactive_navigation_hints_errors_and_repeat(self):
        status, output = self.call(["--interactive"], [
            "invalid", "1", "hint", "DROP TABLE account", "SELECT 1; SELECT 2;",
            "answer", "answer", "back",
            "ownership", "SELECT SUM(balance_pence) AS total_pence FROM account", "quit",
        ])
        self.assertEqual(status, 0)
        self.assertIn("Choose one of the listed lessons", output)
        self.assertIn("Count account_id", output)
        self.assertIn("Query rejected:", output)
        self.assertIn("Matches the example", output)
        self.assertEqual(output.count("[counts]"), 2)

    def test_interactive_eof_and_interrupt_exit_cleanly(self):
        for error in (EOFError(), KeyboardInterrupt()):
            with self.subTest(error=type(error).__name__):
                status, output = self.call(["--interactive"], [error])
                self.assertEqual(status, 0)
                self.assertIn("database is discarded", output)

    def test_commands_work_from_unrelated_directory_and_create_no_files(self):
        script = str(Path(tutorial.__file__).resolve())
        with tempfile.TemporaryDirectory() as directory:
            result = subprocess.run([sys.executable, script, "--query", "SELECT COUNT(*) FROM account"],
                                    cwd=directory, text=True, capture_output=True, timeout=10)
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertIn("5", result.stdout)
            self.assertEqual(list(Path(directory).iterdir()), [])


if __name__ == "__main__":
    unittest.main()
