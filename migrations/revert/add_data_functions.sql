-- Revert data_to_dashboard:add_data_functions from pg

BEGIN;

DROP FUNCTION IF EXISTS insert_random_transaction(transactions INTEGER);

-- Remove the plpython3u extension
DROP EXTENSION IF EXISTS plpython3u;

COMMIT;
