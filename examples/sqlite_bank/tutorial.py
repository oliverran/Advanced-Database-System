#!/usr/bin/env python3
"""Offline SQL lessons over disposable, synthetic SQLite data (stdlib only)."""

import argparse
from contextlib import contextmanager
from dataclasses import dataclass
from pathlib import Path
import sqlite3
from typing import Iterator

HERE = Path(__file__).resolve().parent
MAX_ROWS = 100
MAX_SQL_LENGTH = 10_000
TABLES = frozenset({
    "branch", "customer", "account", "customer_account", "customer_phone", "employee",
})
FUNCTIONS = frozenset({
    "abs", "avg", "coalesce", "count", "ifnull", "instr", "length", "lower",
    "max", "min", "nullif", "round", "substr", "substring", "sum", "total",
    "trim", "typeof", "upper",
})


@dataclass(frozen=True)
class Result:
    columns: tuple[str, ...]
    rows: tuple[tuple, ...]


@dataclass(frozen=True)
class Lesson:
    key: str
    title: str
    task: str
    hint: str
    explanation: str
    sql: str
    expected: Result


LESSONS = (
    Lesson(
        "counts", "Keep the branch with zero accounts",
        "Count saving accounts per branch, including branches with no accounts.",
        "Start with branch, LEFT JOIN account, and put the type filter in ON. "
        "Count account_id, not COUNT(*).",
        "B03 survives the LEFT JOIN. A WHERE filter on account_type would remove "
        "it; COUNT(*) would count its one NULL-extended row as an account.",
        """SELECT b.branch_id, b.city, COUNT(a.account_id) AS saving_accounts
FROM branch AS b
LEFT JOIN account AS a
  ON a.branch_id = b.branch_id AND a.account_type = 'saving'
GROUP BY b.branch_id, b.city
ORDER BY b.branch_id;""",
        Result(("branch_id", "city", "saving_accounts"), (
            ("B01", "Edinburgh", 2), ("B02", "Glasgow", 1), ("B03", "Dundee", 0),
        )),
    ),
    Lesson(
        "ties", "Return every highest-balance account",
        "Find the saving account(s) with the highest balance in each branch. "
        "Keep ties, and show account IDs rather than owners.",
        "Compute MAX(balance_pence) by branch in a CTE, then join it back to account.",
        "B01 has two tied accounts. LIMIT 1 would lose a valid answer. B03 has no "
        "saving account, so it correctly has no winner. Pence are integer units.",
        """WITH highest AS (
  SELECT branch_id, MAX(balance_pence) AS balance_pence
  FROM account
  WHERE account_type = 'saving'
  GROUP BY branch_id
)
SELECT a.branch_id, a.account_id, a.balance_pence
FROM account AS a
JOIN highest AS h
  ON h.branch_id = a.branch_id AND h.balance_pence = a.balance_pence
WHERE a.account_type = 'saving'
ORDER BY a.branch_id, a.account_id;""",
        Result(("branch_id", "account_id", "balance_pence"), (
            ("B01", "A01", 125000), ("B01", "A02", 125000), ("B02", "A04", 80000),
        )),
    ),
    Lesson(
        "ownership", "Avoid double-counting joint accounts",
        "Sum balances of accounts that have at least one owner, once per account.",
        "Use EXISTS to test ownership without multiplying account rows. "
        "SUM(DISTINCT balance_pence) is also wrong when two accounts have equal balances.",
        "The correct total is 390000 pence. A direct ownership join totals 515000 "
        "because joint account A01 appears twice. SUM(DISTINCT balance_pence) totals "
        "265000 because A01 and A02 legitimately share the same balance.",
        """SELECT SUM(a.balance_pence) AS total_pence
FROM account AS a
WHERE EXISTS (
  SELECT 1 FROM customer_account AS ca WHERE ca.account_id = a.account_id
);""",
        Result(("total_pence",), ((390000,),)),
    ),
    Lesson(
        "phones", "Flatten a nested collection",
        "List each customer who has a mobile phone exactly once, even with two mobiles.",
        "customer_phone replaces the Oracle nested collection. Use a correlated EXISTS.",
        "Demo Ben has two mobile numbers but appears once. Demo Cleo has no phones. "
        "Phone values are text, so the leading zero is preserved.",
        """SELECT c.customer_id, c.display_name
FROM customer AS c
WHERE EXISTS (
  SELECT 1 FROM customer_phone AS p
  WHERE p.customer_id = c.customer_id AND p.label = 'mobile'
)
ORDER BY c.customer_id;""",
        Result(("customer_id", "display_name"), (("C01", "Demo Ada"), ("C02", "Demo Ben"))),
    ),
    Lesson(
        "supervisors", "Follow a self-referencing relationship",
        "List every employee and their supervisor, retaining employees without one.",
        "LEFT JOIN employee to itself with two aliases. supervisor_id references employee_id.",
        "Two aliases play different roles in the same table. NULL means no supervisor "
        "in this fixture; it is not an empty string or a missing employee row.",
        """SELECT e.employee_id, e.display_name AS employee,
       s.display_name AS supervisor
FROM employee AS e
LEFT JOIN employee AS s ON s.employee_id = e.supervisor_id
ORDER BY e.employee_id;""",
        Result(("employee_id", "employee", "supervisor"), (
            ("E01", "Demo Morgan", None), ("E02", "Demo Rowan", "Demo Morgan"),
            ("E03", "Demo Taylor", "Demo Morgan"), ("E04", "Demo Quinn", None),
        )),
    ),
)
BY_KEY = {lesson.key: lesson for lesson in LESSONS}


def _read_only(action, first, second, database, source):
    """Defense in depth: whitelist the operations used by these SQL exercises."""
    if action in (sqlite3.SQLITE_SELECT, sqlite3.SQLITE_RECURSIVE):
        return sqlite3.SQLITE_OK
    # SQLite may omit the database name for a table-only read (e.g. COUNT(*)).
    if action == sqlite3.SQLITE_READ and database in ("main", None) and first in TABLES:
        return sqlite3.SQLITE_OK
    # CTE/derived-table COUNT(*) reads have no column or database name. No other
    # tables can be attached or created in this isolated, read-only connection.
    if (action == sqlite3.SQLITE_READ and database is None and second == ""
            and first and not first.lower().startswith("sqlite_")):
        return sqlite3.SQLITE_OK
    if action == sqlite3.SQLITE_FUNCTION and (second or "").lower() in FUNCTIONS:
        return sqlite3.SQLITE_OK
    return sqlite3.SQLITE_DENY


@contextmanager
def database() -> Iterator[sqlite3.Connection]:
    """No connection string or file path input: this always creates a private memory DB."""
    connection = sqlite3.connect(":memory:")
    try:
        connection.execute("PRAGMA foreign_keys = ON")
        for name in ("schema.sql", "seed.sql"):
            connection.executescript((HERE / name).read_text(encoding="utf-8"))
        connection.commit()
        connection.execute("PRAGMA query_only = ON")
        # Python 3.11+ supports SQLite runtime limits. Older supported Python still
        # has the authorizer, SQL length check, result cap and progress handler.
        if hasattr(connection, "setlimit"):
            connection.setlimit(sqlite3.SQLITE_LIMIT_LENGTH, 1_000_000)
            connection.setlimit(sqlite3.SQLITE_LIMIT_SQL_LENGTH, MAX_SQL_LENGTH)
            connection.setlimit(sqlite3.SQLITE_LIMIT_COLUMN, 50)
            connection.setlimit(sqlite3.SQLITE_LIMIT_EXPR_DEPTH, 100)
        connection.set_authorizer(_read_only)
        yield connection
    finally:
        connection.close()


def run_query(connection: sqlite3.Connection, sql: str) -> Result:
    """Run one read-only statement, with bounded SQL length, VM work and result rows."""
    if not sql.strip():
        raise ValueError("Enter a SELECT or WITH ... SELECT query.")
    if len(sql.encode("utf-8")) > MAX_SQL_LENGTH:
        raise ValueError(f"Query is too long (limit: {MAX_SQL_LENGTH} UTF-8 bytes).")
    ticks = 0

    def budget():
        nonlocal ticks
        ticks += 1
        return ticks >= 100  # Abort after roughly 100,000 SQLite VM instructions.

    connection.set_progress_handler(budget, 1000)
    cursor = connection.cursor()
    try:
        try:
            cursor.execute(sql)
        except sqlite3.Warning as error:
            # Python 3.10 reports multiple statements as Warning, not Error.
            raise sqlite3.ProgrammingError(str(error)) from error
        if cursor.description is None:
            raise ValueError("Only queries returning rows are supported.")
        rows = tuple(cursor.fetchmany(MAX_ROWS + 1))
        if len(rows) > MAX_ROWS:
            raise ValueError(f"More than {MAX_ROWS} rows. Add a LIMIT or a narrower filter.")
        return Result(tuple(column[0] for column in cursor.description), rows)
    finally:
        cursor.close()
        connection.set_progress_handler(None, 0)


def format_result(result: Result) -> str:
    values = [result.columns, *(
        tuple("NULL" if value is None else str(value) for value in row)
        for row in result.rows
    )]
    widths = [max(len(str(row[i])) for row in values) for i in range(len(result.columns))]
    lines = [" | ".join(str(value).ljust(width) for value, width in zip(row, widths))
             for row in values]
    lines.insert(1, "-+-".join("-" * width for width in widths))
    return "\n".join(lines) + f"\n({len(result.rows)} rows)"


def show_answer(connection: sqlite3.Connection, lesson: Lesson) -> None:
    print(f"\n[{lesson.key}] {lesson.title}\n{lesson.task}\n\n{lesson.sql}\n")
    result = run_query(connection, lesson.sql)
    if result != lesson.expected:
        raise RuntimeError(f"Fixture verification failed for {lesson.key}.")
    print(format_result(result))
    print(f"\nWhy: {lesson.explanation}\n")


def interactive(connection: sqlite3.Connection) -> None:
    print("Synthetic bank SQL lab. Offline, read-only, in memory. No real accounts.")
    print("Choose a lesson, try a one-line SQL query, then ask for its answer.")
    while True:
        print("\n" + "\n".join(f"{i}. {lesson.key}: {lesson.title}"
                                for i, lesson in enumerate(LESSONS, 1)))
        choice = input("Lesson number/key (or quit): ").strip().lower()
        if choice in {"q", "quit", "exit"}:
            return
        lesson = BY_KEY.get(choice)
        if choice.isdecimal() and len(choice) < 3 and 1 <= int(choice) <= len(LESSONS):
            lesson = LESSONS[int(choice) - 1]
        if lesson is None:
            print("Choose one of the listed lessons.")
            continue
        print(f"\n{lesson.task}\nCommands: hint, answer, back, quit; or enter a one-line SELECT.")
        while True:
            query = input(f"{lesson.key}> ").strip()
            command = query.lower()
            if command in {"q", "quit", "exit"}:
                return
            if command in {"b", "back"}:
                break
            if command in {"h", "hint"}:
                print(lesson.hint)
            elif command in {"a", "answer"}:
                show_answer(connection, lesson)
            else:
                try:
                    result = run_query(connection, query)
                    print(format_result(result))
                    if result == lesson.expected:
                        print("Matches the example, including column names and row order.")
                    else:
                        print("Compare with 'answer'. A different valid query may use different labels/order.")
                except (sqlite3.Error, ValueError) as error:
                    print(f"Query rejected: {error}")


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    group = parser.add_mutually_exclusive_group()
    group.add_argument("--interactive", action="store_true", help="Try lessons in the terminal")
    group.add_argument("--list", action="store_true", help="List the five lesson keys")
    group.add_argument("--lesson", choices=tuple(BY_KEY), help="Run one explained example")
    group.add_argument("--query", help="Run a single read-only SQLite SELECT query")
    group.add_argument("--all", action="store_true", help="Run and verify all examples (default)")
    args = parser.parse_args(argv)
    if args.list:
        for lesson in LESSONS:
            print(f"{lesson.key}: {lesson.title}")
        return 0
    try:
        with database() as connection:
            if args.interactive:
                interactive(connection)
            elif args.query is not None:
                print(format_result(run_query(connection, args.query)))
            else:
                for lesson in (BY_KEY[args.lesson],) if args.lesson else LESSONS:
                    show_answer(connection, lesson)
    except (EOFError, KeyboardInterrupt):
        print("\nSession closed. The in-memory database is discarded.")
    except (sqlite3.Error, ValueError, RuntimeError) as error:
        print(f"Error: {error}")
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
