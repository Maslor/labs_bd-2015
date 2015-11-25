# 1.a)
select distinct customer_name 
from account natural join customer;

# 2 
# a)
select customer_name, customer_street
from customer
where customer_name not in (
	select customer_name from borrower);

# d)
select sum(balance) as total
from branch natural join account
where branch_city = 'Brooklyn';

# j)
select customer_name, count(customer_name)
from loan natural join borrower
group by customer_name
having count(*)>=2
order by customer_name asc;

# h)
select branch_name, count(*)
from account
group by branch_name
having count(*) >= all (
	select count(*)
	from account
	group by branch_name
	); 

# i)

/* try 1
select * 
from (
	select * from branch as B1 natural join account as A1
	union
	select * from branch as B2 natural join loan as L1
	group by branch_name
	) natural join customer as C3
union
select *
from (
	select * from branch as B3 natural join account as A2
	union
	select * from branch as B4 natural join loan as L2
	group by branch_name
	) natural join customer as C4;
*/

select *
from customer as c
where not exists(
select branch_name
from branch as b
where not exists(

select branch_name
from account
	natural Join depositor
where customer_name=c.customer_name
	and branch_name=b.branch_name));