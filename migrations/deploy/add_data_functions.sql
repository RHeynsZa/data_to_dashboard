-- Deploy data_to_dashboard:add_data_functions to pg
BEGIN;

CREATE EXTENSION IF NOT EXISTS plpython3u;

-- Function to insert a new transaction into the transactions table and return the id
CREATE OR REPLACE FUNCTION insert_random_transaction(transactions INTEGER)
RETURNS VOID
AS $$
    import random
    import datetime

    # Get accounts
    accounts = plpy.execute("SELECT id FROM accounts")

    for k in range(transactions):
        # Date starts at 2010-01-01
        date = datetime.date(2010, 1, 1) + datetime.timedelta(days=k)

        # Get random account
        account = random.choice(accounts)

        # Get random amount
        amount = random.randint(-1000, 1000)

        # Get random category
        category = random.choice(['Food', 'Clothes', 'Entertainment', 'Travel', 'Other'])

        # Insert transaction
        plan = plpy.prepare("INSERT INTO transactions (account_id, amount, category, created_at) VALUES ($1, $2, $3, $4) RETURNING id", ["integer", "numeric", "text", "timestamp"])
        result = plpy.execute(plan, [account['id'], amount, category, date])


$$ LANGUAGE plpython3u;


SELECT insert_random_transaction(1000);

COMMIT;
