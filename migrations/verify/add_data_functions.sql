-- Verify data_to_dashboard:add_data_functions on pg

BEGIN;

-- Check if the plpython3u extension exists
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM pg_extension WHERE extname = 'plpython3u') THEN
        RAISE NOTICE 'The plpython3u extension already exists';
    ELSE
        RAISE ERROR 'The plpython3u extension does not exist';
    END IF;
END

$$;

-- Check if the insert_random_transaction function exists
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM pg_proc WHERE proname = 'insert_random_transaction') THEN
        RAISE NOTICE 'The insert_random_transaction function already exists';
    ELSE
        RAISE ERROR 'The insert_random_transaction function does not exist';
    END IF;
END

ROLLBACK;
