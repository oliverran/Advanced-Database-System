# Offline bank SQL lab

Learn five relational SQL patterns using entirely invented data. All customers, employees, accounts, balances, and phone entries are synthetic. The fixture phone numbers use UK fictional-use ranges. Nothing is imported from the historical coursework exports.

This lab uses **SQLite**, not Oracle. Python 3.10+ with the standard `sqlite3` module is the only requirement. There is no `pip install`, database login, server, Docker image, or network access in the lab.

## 1. Start a session

Run these commands from the repository root:

```sh
python3 examples/sqlite_bank/tutorial.py --interactive
```

On Windows, replace `python3` with `py -3` where appropriate. Select a lesson by number or key:

```text
Lesson number/key (or quit): 3
ownership> SELECT SUM(balance_pence) AS total_pence FROM account;
total_pence
-----------
390000
(1 rows)
```

Inside a lesson:

- Enter a **single-line** `SELECT` or `WITH ... SELECT` statement to explore the data.
- `hint` explains the next step without displaying the complete solution.
- `answer` shows the worked SQL, its verified result, and an explanation.
- `back` returns to the lesson menu. `quit`, EOF, or Ctrl+C closes the session.
- Mistakes are reported without ending the session. You can repeat any lesson.

A matching answer is checked by its columns, values, and row order. This is feedback for the fixture, not a general SQL grader: equivalent queries can use different column names or ordering, and a fixture-only shortcut can still match.

Each run starts from the same fresh in-memory fixture. There is no database file to create, reset, or delete. The runner only reads `schema.sql` and `seed.sql` beside itself; it never opens the original Oracle files.

## 2. Know the data

The schema is in [schema.sql](schema.sql); all rows are in [seed.sql](seed.sql).

| Table | Key and useful columns | Rows |
| --- | --- | ---: |
| `branch` | `branch_id`, `city` | 3 |
| `customer` | `customer_id`, `display_name` | 4 |
| `account` | `account_id`, `branch_id`, `account_type`, `balance_pence` | 5 |
| `customer_account` | Composite key: `customer_id`, `account_id` | 6 |
| `customer_phone` | Composite key: `customer_id`, `phone`; `label` | 5 |
| `employee` | `employee_id`, `display_name`, `branch_id`, `supervisor_id` | 4 |

Relationships:

```text
branch   1 ---- many account
customer many ---- many account  (through customer_account)
customer 1 ---- many customer_phone
branch   1 ---- many employee
employee 1 ---- many employee    (supervisor_id; nullable)
```

Foreign keys are enabled. Balances are integer pence, not floating-point pounds. `125000` means £1,250.00. The simplified schema permits no negative balances and models only `saving` and `current` account categories; it is not a production banking model.

The deliberately awkward cases make the lessons useful:

- B03 (Dundee) has no accounts.
- A01 and A02 tie at 125000 pence in B01.
- A01 has two owners; the ownership table therefore has six rows for five accounts.
- Demo Ben has two mobile numbers; Demo Cleo has no phones.
- Two employees have no supervisor.

Inspect any table:

```sh
python3 examples/sqlite_bank/tutorial.py --query "SELECT * FROM account ORDER BY account_id"
```

## 3. Work through the lessons

### `counts`: keep zero-count branches

```sh
python3 examples/sqlite_bank/tutorial.py --lesson counts
```

Expected saving-account counts: B01 = 2, B02 = 1, B03 = 0.

Start from `branch`, put the saving-account condition in the `LEFT JOIN ... ON`, and count the non-null account ID. Try moving the condition into `WHERE`, then try `COUNT(*)`. Why does each version change B03's result?

### `ties`: keep every maximum

Expected `(branch_id, account_id, balance_pence)` rows:

```text
B01  A01  125000
B01  A02  125000
B02  A04   80000
```

Compute maximum saving balances per branch in a common table expression, then join back to the accounts. Both tied accounts should survive. B03 has no saving account, so it has no winning row. Joining to owners is a different question and may produce multiple rows per account.

### `ownership`: aggregate at the correct level

Expected total for owned accounts: **390000 pence**.

Try the tempting but incorrect query:

```sql
SELECT SUM(a.balance_pence) AS total_pence
FROM account AS a
JOIN customer_account AS ca ON ca.account_id = a.account_id;
```

It returns **515000** because A01 is counted twice. `SUM(DISTINCT a.balance_pence)` returns **265000**, incorrectly collapsing the equal balances of A01 and A02. Use `EXISTS` to test ownership while retaining one row per account. This example is about aggregation, not allocating a joint balance between people.

### `phones`: express collection membership

Expected customers: **C01 / Demo Ada** and **C02 / Demo Ben**, each once.

Use the related `customer_phone` table and an `EXISTS` predicate for `label = 'mobile'`. Contrast it with a direct join, which produces two rows for Demo Ben. Phone values remain text so the leading zero is preserved.

### `supervisors`: join a table to itself

Expected supervisors:

```text
E01  Demo Morgan  NULL
E02  Demo Rowan   Demo Morgan
E03  Demo Taylor  Demo Morgan
E04  Demo Quinn   NULL
```

Use two aliases for `employee`, joining the employee's `supervisor_id` to the supervisor's `employee_id`. Replace `LEFT JOIN` with `JOIN` to see which employees disappear. The sample demonstrates direct supervision only, not recursive hierarchy traversal or cycle detection.

## SQLite versus the original Oracle project

| Historical Oracle concept | This teaching example |
| --- | --- |
| `CREATE TYPE ... AS OBJECT`, `UNDER`, object tables | Ordinary relational tables; inheritance is not implemented |
| Structured `name_Type` and `address_Type` | Simplified display names and branch city; not a field-by-field migration |
| `REF`, `DEREF`, object identity | Text primary keys, foreign keys, and explicit joins |
| Nested `phone_type_table` collections | A separate `customer_phone` table |
| PL/SQL member functions and `ALTER TYPE` | Plain read-only SQL; no equivalent method bodies |
| `DATE`, `MONTHS_BETWEEN`, medal logic | Omitted; no claims of matching Oracle date or award semantics |
| Original account balance, interest, overdraft fields | Explicit integer pence; interest and overdrafts omitted |
| SQL*Plus `/`, `SHOW ERROR`, Oracle DDL | Not supported by this runner |

SQLite has different typing, date, collation, and NULL/empty-string behavior. For example, SQLite preserves an empty string, whereas Oracle treats a zero-length character value as NULL. The fixtures avoid relying on dialect-specific case and date rules. These five exercises adapt themes from the coursework; they are not verified answers to every historical question or a conversion of its SQL.

The historical schema includes destructive statements, repeated type definitions, and inconsistent `employee`/`employee_table` names. Do not paste it into this runner or a real database. An Oracle port would require a separate audit and an explicitly disposable Oracle environment.

## Safety and limits

- The runner always connects to SQLite `:memory:`. It accepts no database path, URL, credentials, or external SQL-file option.
- Custom queries have SQLite query-only mode and an operation/function allowlist. Schema changes, writes, `ATTACH`, `PRAGMA`, transactions, extension loading, and file-reading functions are rejected.
- A query is limited to 10,000 UTF-8 bytes, 100 result rows, and roughly 100,000 SQLite VM instructions. Python 3.11+ also applies SQLite runtime limits to SQL/value length, columns, and expression depth.
- This is a local learning tool, **not a hardened multi-user SQL sandbox**. Do not expose it as a service or use it to process hostile input. Limits are for catching accidental expensive exercises, not an operating-system security boundary.
- The Python source and bundled SQL are local trusted code. Changing them can change these guarantees.

Only a small set of teaching functions is enabled: `abs`, `avg`, `coalesce`, `count`, `ifnull`, `instr`, `length`, `lower`, `max`, `min`, `nullif`, `round`, `substr`, `substring`, `sum`, `total`, `trim`, `typeof`, `upper`. Other otherwise-valid SQLite queries may be rejected intentionally.

## Automated checks

```sh
python3 -m unittest discover -s examples/sqlite_bank -p 'test_*.py' -v
python3 examples/sqlite_bank/tutorial.py --all
```

The 22 tests check exact lesson results, the two wrong aggregation totals, constraints, query rejection and recovery, finite/infinite recursive queries, CTE aggregation, result and input limits, repeat navigation, EOF/Ctrl+C, and execution from another working directory without database-file creation. CI covers Python 3.10, 3.12, and 3.14. It does not run Oracle, access a database server, or validate the archived SQL.
