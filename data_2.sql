-- SELF JOIN
-- join another copy of a table to itself 
-- used to compare rows of the same table 
-- helps to display a heirarchy of data 

alter table customers
	add referral_id int;
    
update customers
set referral_id = 2
where customer_id = 4;

select * from customers as a
inner join
customers as b
on a.referral_id = b. customer_id;

select a.customer_id, a.first_name, a.last_name,
	b.first_name, b.last_name
    from customers as a inner join
    customers as b
    ON a.referral_id = b.customer_id;
    
select a.customer_id, a.first_name, a.last_name,
	CONCAT(b.first_name," ", b.last_name) as "REFERED BY"
		from customers as a 
			LEFT JOIN
		customers as b
        ON a.referral_id = b.customer_id;

select * from customers;

select * from employees;

alter table employees
add supervisor_id int;

update employees
set supervisor_id = 1
	where employee_id = 5;
    
select * from 
employees as a
inner join employees as b
on a.supervisor_id = b.employee_id;

select a.first_name, b.last_name,
CONCAT(b.first_name, " ", b.last_name) as "reports to"
from employees as a
inner join 
employees as b
	on a.supervisor_id = b.employee_id;

select * from employees;



-- VIEWS
-- virtual table based on the result-set of an SQL statement
-- the fields in a view are fields from one or more real tables in a database
-- they are not real tables, but can be interacted with as if they were

create view employee_attandance 
as 
select first_name, last_name
from employees;

select * from employee_attandance 
order by last_name asc;

drop view employee_attandance;

select * from customers;

alter table customers
add customer_email varchar(50);

update customers
set customer_email = "puff#gmail.com"
where customer_id = 4;

select * from customers;

create view customers_emails as
select customer_email 
from customers;

select * from customers_emails;

insert into customers 
values (5, "pearl", "Jack", null, "pearl@gmail.com");

select * from customers;




-- index (Btree data structure)
-- indexes are used to find values within a specific column more quickly
-- MYSQL normally searches sequentially through a column
-- the longer the column, the more expensive the operation is  
-- UPDATE takes more time , SELECT takes less time


select * from customers;

show indexes from customers;

create index last_name_idx
on customers(last_name);

select * from customers
where last_name = "puff";

create index last_name_first_name_idx
ON customers(last_name, first_name);

show indexes from customers;

alter table customers
drop index last_name_idx;

select * from customers where 
last_name = "Jack" AND first_name = "pearl";