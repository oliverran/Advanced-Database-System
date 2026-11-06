-- A new, deliberately simplified relational teaching schema. Not Oracle SQL.
-- The runner executes this file only in a fresh :memory: SQLite database.
CREATE TABLE branch (
    branch_id TEXT PRIMARY KEY NOT NULL,
    city TEXT NOT NULL
);
CREATE TABLE customer (
    customer_id TEXT PRIMARY KEY NOT NULL,
    display_name TEXT NOT NULL
);
CREATE TABLE account (
    account_id TEXT PRIMARY KEY NOT NULL,
    branch_id TEXT NOT NULL REFERENCES branch(branch_id),
    account_type TEXT NOT NULL CHECK (account_type IN ('saving', 'current')),
    balance_pence INTEGER NOT NULL
        CHECK (typeof(balance_pence) = 'integer' AND balance_pence >= 0)
);
CREATE TABLE customer_account (
    customer_id TEXT NOT NULL REFERENCES customer(customer_id),
    account_id TEXT NOT NULL REFERENCES account(account_id),
    PRIMARY KEY (customer_id, account_id)
);
CREATE TABLE customer_phone (
    customer_id TEXT NOT NULL REFERENCES customer(customer_id),
    label TEXT NOT NULL CHECK (label IN ('mobile', 'home')),
    phone TEXT NOT NULL,
    PRIMARY KEY (customer_id, phone)
);
CREATE TABLE employee (
    employee_id TEXT PRIMARY KEY NOT NULL,
    display_name TEXT NOT NULL,
    branch_id TEXT NOT NULL REFERENCES branch(branch_id),
    supervisor_id TEXT REFERENCES employee(employee_id),
    CHECK (supervisor_id IS NULL OR supervisor_id != employee_id)
);
