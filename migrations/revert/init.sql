-- Revert data_to_dashboard:init from pg
BEGIN
;

-- Remove the accounts table
DROP TABLE accounts;

-- Remove the transactions table
DROP TABLE transactions;

COMMIT;
