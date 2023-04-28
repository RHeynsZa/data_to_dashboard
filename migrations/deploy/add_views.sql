-- Deploy data_to_dashboard:add_views to pg

BEGIN;

CREATE OR REPLACE VIEW vw_account_balance AS
SELECT
    a.id AS account_id,
    a.name AS account_name,
    SUM(amount) AS balance
FROM
    accounts a
    JOIN transactions ON a.id = transactions.account_id
GROUP BY
    a.id,
    a.name;

-- And a materialized view
CREATE MATERIALIZED VIEW mvw_account_balance AS
SELECT
    a.id AS account_id,
    a.name AS account_name,
    SUM(amount) AS balance
FROM
    accounts a
    JOIN transactions ON a.id = transactions.account_id
GROUP BY
    a.id,
    a.name;


CREATE UNIQUE INDEX mvw_account_balance_name_idx ON mvw_account_balance (balance);

COMMIT;
