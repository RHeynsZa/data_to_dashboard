-- Revert data_to_dashboard:initial_data from pg
BEGIN
;

-- Clear transactions table
DELETE FROM
    transactions;

DELETE FROM
    accounts
WHERE
    name = 'Mr Moneybags'
    OR name = 'Dr Evil'
    OR name = 'Mr Burns';

COMMIT;
