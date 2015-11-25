# Lab 08

# a)
DELIMITER //

/*
create function diff (c_name varchar(40))
	returns numeric(12,4)
begin
	declare tot_bal numeric(12,4);
	declare tot_am numeric(12,4);

	select sum(bal) into tot_bal
	from account natural join depositor
	where customer_name = c_name;

	select sum(am) into tot_am
	from loan natural join borrower
	where customer_name = c_name;

	return ifnull(tot_bal, 0) - ifnull(tot_am,0);
end //

*/

# b)

create function diff_mean (a_name varchar(40), a_name2 varchar(40))
	returns numeric(12,4)
begin
	declare a_mean  numeric(12,4);
	declare a2_mean numeric(12,4);

	select avg(balance) into a_mean
	from account 
	where branch_name = a_name;

	select avg(balance) into a2_mean
	from account 
	where branch_name = a2_name;

	return ifnull(a_mean,0) - a2_mean;
end //

DELIMITER ;