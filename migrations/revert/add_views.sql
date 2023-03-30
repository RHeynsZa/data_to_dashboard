-- Revert data_to_dashboard:add_views from pg

BEGIN;

DROP VIEW IF EXISTS vw_account_balance;
DROP MATERIALIZED VIEW IF EXISTS mvw_account_balance;

COMMIT;
