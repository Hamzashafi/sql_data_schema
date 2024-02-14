-- subquery
-- a query within another query
-- query(subquery)

select * from employees;

select first_name, last_name, hourly_pay,
(select AVG(hourly_pay) from employees) as avg_pay
from employees;

select first_name, last_name, hourly_pay 
from employees
where hourly_pay > (select avg(hourly_pay) from employees);

select * from transactions;

select first_name, last_name
from customers
where customer_id IN
(select distinct customer_id
from transactions
where customer_id IS NOT NULL);

select first_name, last_name
from customers
where customer_id NOT IN
(select distinct customer_id
from transactions 
where customer_id IS NOT NULL);


-- GROUP BY  = aggregate all rows by a specific column 
--     			often used with agregate functions
--  			ex. SUM(), MAX(), MIN(), AVG(), COUNT()

CREATE TABLE candies (
    color VARCHAR(20),
    quantity INT
);

SELECT color, SUM(quantity) AS total_quantity
FROM candies
GROUP BY color;

insert into candies (color, quantity)
values ("red", 50),
("blue", 30),
("green", 70),
("black", 80);

select * from candies;

alter table transactions
	add column order_date varchar(50)
		after customer_id;
        
update transactions
set order_date = "2023-01-13"
	where transaction_id = 1008;
    
select sum(amount), order_date
from transactions
group by order_date;

select count(amount), order_date
from transactions
group by order_date;

select sum(amount), customer_id
from transactions
group by customer_id;

select count(amount), customer_id
from transactions
group by customer_id;

select count(amount), customer_id
from transactions
group by customer_id
having count(amount) > 1 AND customer_id IS NOT NULL;


select * from transactions;


-- ROLLUP, extension of the group by clause
-- produces another row and shows the grand total (super-aggregate value)

select * from transactions;

select sum(amount), order_date
from transactions
group by order_date with rollup;

select count(transaction_id), order_date
from transactions
group by order_date with rollup;

select count(transaction_id) as "# of orders", customer_id
from transactions
group by customer_id with rollup;

select * from employees;

select sum(hourly_pay), employee_id
from employees
group by employee_id with rollup;


-- ON DELETE SET NULL = when FK is deleted, replace it with NULL
-- ON DELETE CASCADE = when FK is deleted, delete the row

set foreign_key_checks = 0;

delete from customers 
where customer_id = 1;

select * from customers;

select * from transactions;

insert into customers
values (1, "jack", "black", 2, "fish@gmail.com");

alter table transactions 
drop foreign key fk_customer_id;

alter table transactions 
add constraint fk_customer_id 
	foreign key(customer_id) references customers(customer_id)
    ON DELETE SET NULL;

delete from transactions
where customer_id = 1;
    
select * from transactions;

select * from customers;

update transactions
set customer_id = 1 
where transaction_id = 1008;

alter table transactions 
add constraint fk_transaction_id
foreign key(customer_id) references customers(customer_id)
	ON DELETE CASCADE;
    
select * from transactions;

select * from customers;

delete from customers
where customer_id = 1;