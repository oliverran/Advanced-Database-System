# Advanced-Database-System

An Oracle object-relational database coursework archive, with a new offline SQL learning lab built around a small, fictional bank.

**Start with the [interactive SQLite tutorial](examples/sqlite_bank/README.md).** It uses Python's standard library, creates a fresh in-memory database, and needs no database server, credentials, packages, or network connection after download.

## Try it in a minute

From the repository root, with Python 3.10 or later and its `sqlite3` module:

```sh
python3 examples/sqlite_bank/tutorial.py --interactive
```

Choose a lesson, enter a one-line query, and use `hint` or `answer` when needed. Use `back` to change lessons and `quit` to finish. On Windows, use `py -3` instead of `python3` if needed.

Prefer to read a complete worked example?

```sh
python3 examples/sqlite_bank/tutorial.py --lesson ownership
python3 examples/sqlite_bank/tutorial.py --all
```

The five lessons cover:

1. `LEFT JOIN` and counting branches with zero accounts.
2. Maximum balances per branch, including ties.
3. Joint ownership and avoiding duplicate aggregation.
4. Replacing nested phone collections with a related table.
5. Employee-supervisor relationships through self-joins.

For example, summing balances once per account gives **390000 pence**. Joining accounts directly to owners gives **515000 pence**, because a joint account is counted twice. The fixtures also include two equal balances to show why `SUM(DISTINCT balance_pence)` is not the fix.

Read the [schema, expected results, exercises, and Oracle differences](examples/sqlite_bank/README.md).

## Historical Oracle material

The original coursework, SQL, and screenshots remain unchanged:

- [Object types and schema](Advanced%20database%20system/sql%20doc/Task2.redign.sql)
- [Original question queries](Advanced%20database%20system/sql%20doc/Task4.Questions.sql)
- [ER diagram](ER%20diagram.PNG)
- [Coursework files and screenshots](Advanced%20database%20system/)

**Do not run the historical SQL against a database you care about.** It contains `DROP TYPE ... FORCE` and `DROP TABLE` commands. The schema file repeats type declarations, and some methods and queries refer to `employee_table` while the schema creates `employee`. These files are reference material, not a verified setup or migration sequence.

The SQLite lab is a separate, simplified relational example. It does not execute or import historical scripts or exports, and it does not reproduce Oracle object types, inheritance, `REF`/`DEREF`, nested tables, or PL/SQL member methods. No Oracle runtime or original coursework queries have been validated by the new test suite.

## Test the new lab

```sh
python3 -m unittest discover -s examples/sqlite_bank -p 'test_*.py' -v
python3 examples/sqlite_bank/tutorial.py --all
```

CI runs these checks on Python 3.10, 3.12, and 3.14. All test databases are disposable and in memory. The tests cover expected answers, SQL pitfalls, fixture constraints, read-only restrictions, query limits, and repeated/invalid/interrupted terminal interactions.
