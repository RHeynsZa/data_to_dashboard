-- Verify data_to_dashboard:init on pg
BEGIN
;

-- Verify the accounts table
SELECT
    'accounts' AS table,
    'id' AS column,
    'SERIAL PRIMARY KEY' AS expected,
    pg_catalog.format_type(a .atttypid, a .atttypmod) AS actual
FROM
    pg_catalog.pg_attribute a;

-- Verify the transactions table
SELECT
    'transactions' AS table,
    'id' AS column,
    'SERIAL PRIMARY KEY' AS expected,
    pg_catalog.format_type(a .atttypid, a .atttypmod) AS actual
FROM
    pg_catalog.pg_attribute a;

ROLLBACK;
