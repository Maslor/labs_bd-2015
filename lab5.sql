/* 2a */ 
select customer_name, customer_street, customer_city
from customer 
where customer_name not in (select customer_name from borrower);

/* 1c */
select 1.10 * balance
from account
where branch_name = 'downtown';

/* 1d */
select * balance
from account 
	natural join depositor 
where customer_name in ( 
	select customer_name
	from borrower
	where loan_number = 'L-15');

/* 1e */

select distinct customer_name
from customer, branch
where customer_city = branch_city;
	