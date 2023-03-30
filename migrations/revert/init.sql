-- Revert data_to_dashboard:init from pg
BEGIN
;

-- Remove the transactions table
DROP TABLE transactions;

-- Remove the accounts table
DROP TABLE accounts;


COMMIT;
