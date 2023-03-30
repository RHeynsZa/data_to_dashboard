-- Revert data_to_dashboard:initial_data from pg
BEGIN
;

DELETE FROM
    accounts
WHERE
    name = 'Mr Moneybags';

DELETE FROM
    accounts
WHERE
    name = 'Dr Evil';

DELETE FROM
    accounts
WHERE
    name = 'Mr Burns';

COMMIT;
