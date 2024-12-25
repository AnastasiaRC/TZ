with table1 as (select * from (values 
							   (1, 'cpa'),
							   (2, 'cpa'),
							   (3, 'cpa'),
							   (4, 'rs'),
							   (5, 'organic')) 
				as t1 (user_id, traffic)),
	table2 as (select * from (values 
							  (1, 1, 100),
							  (1, 2, 100),
							  (1, 3, 108),
							  (1, 4, 100),
							  (1, 5, 100),
							  (2, 1, 2000),
							  (2, 3, 100),
							  (2, 4, 2000),
							  (3, 4, 3650),
							  (4, 5, 100),
							  (4, 4, 2123),
							  (5, 4, 100),
							  (5, 1, 255)) 
			   as t2 (user_id, ltd, refill)),
	table3 as (select * from (values 
							  (1, 1, 100),
							  (1, 4, 100),
							  (1, 5, 100),
							  (2, 2, 200),
							  (3, 3, 100),
							  (3, 5, 100),
							  (3, 2, 100),
							  (4, 4, 300),
							  (5, 2, 155)) 
			   as t3 (user_id, ltd, coupon)),
	table4 as (select * from (values 
							  (1, 4, 100),
							  (3, 3, 100),
							  (4, 2, 2123),
							  (4, 5, 100),
							  (5, 3, 100)) 
			   as t4 (user_id, ltd, payout)),
	table5 as (select * from (values 
							  (1, 5, 100),
							  (3, 4, 100),
							  (2, 6, 100)) 
			   as t5 (user_id, ltd, fee)),
	all_combinations as (
	select table1.user_id,
	new_table.ltd,
	table1.traffic as tt
	from table1
	CROSS JOIN(SELECT DISTINCT ltd FROM table2)as new_table)

select all_combinations.user_id,
all_combinations.ltd,
coalesce(table2.refill, 0) as "refill, $",
coalesce(table3.coupon, 0) as "coupon, $",
coalesce(table4.payout, 0) as "payout, $",
coalesce(table5.fee, 0) as "fee, $",
all_combinations.tt as "tt"
from all_combinations

left join table2 on all_combinations.user_id = table2.user_id and all_combinations.ltd = table2.ltd
left join table3 on all_combinations.user_id = table3.user_id and all_combinations.ltd = table3.ltd
left join table4 on all_combinations.user_id = table4.user_id and all_combinations.ltd = table4.ltd
left join table5 on all_combinations.user_id = table5.user_id and all_combinations.ltd = table5.ltd
order by all_combinations.user_id, all_combinations.ltd;
