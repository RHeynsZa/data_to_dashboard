SELECT account_name, balance
	FROM public.mvw_account_balance;

select amount, created_at from transactions 
where account_id = (
  SELECT id from accounts where name IN ( '$Account'  )
)
order by created_at;
