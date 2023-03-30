-- Deploy data_to_dashboard:initial_data to pg
BEGIN
;

INSERT INTO
    accounts (name)
VALUES
    ('Mr Moneybags');

INSERT INTO
    accounts (name)
VALUES
    ('Dr Evil');

INSERT INTO
    accounts (name)
VALUES
    ('Mr Burns');

COMMIT;
