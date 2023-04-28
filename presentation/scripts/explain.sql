-- Direct Select
EXPLAIN (ANALYZE, COSTS, VERBOSE, BUFFERS, FORMAT JSON)
SELECT a.id AS account_id,
       a.name AS account_name,
       SUM(amount) AS balance
FROM accounts a
JOIN transactions ON a.id = transactions.account_id
GROUP BY a.id,
         a.name;

-- View
EXPLAIN (ANALYZE, COSTS, VERBOSE, BUFFERS, FORMAT JSON)
SELECT account_id, account_name, balance
	FROM public.vw_account_balance;
