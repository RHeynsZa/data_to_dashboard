-- Verify data_to_dashboard:initial_data on pg
BEGIN
;

-- Since verification only cares whether there is an exception or not, the following
-- will pass, even though it is not valid: (Mr Burns2 does not exist)
SELECT
    *
FROM
    accounts
WHERE
    name = 'Mr Burns2';

-- This is better:
DO $$ BEGIN
    ASSERT 1 = (
        SELECT
            COUNT(*)
        FROM
            accounts
        WHERE
            name = 'Mr Moneybags'
    );

END $$;

DO $$ BEGIN
    ASSERT 1 = (
        SELECT
            COUNT(*)
        FROM
            accounts
        WHERE
            name = 'Dr Evil'
    );

END $$;

DO $$ BEGIN
    ASSERT 1 = (
        SELECT
            COUNT(*)
        FROM
            accounts
        WHERE
            name = 'Mr Burns'
    );

END $$;

-- Or, this also works:
-- Division by zero will throw an exception if the count is not 1
SELECT
    1 / COUNT(*)
FROM
    accounts
WHERE
    name = 'Mr Burns';

ROLLBACK;
