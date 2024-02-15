create table customers (
	customer_id int PRIMARY KEY auto_increment,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

insert into customers (first_name, last_name)
	values 
    ("jack", "black"),
    ("panda", "kungfu"),
    ("anabella", "norman");

select * from customers;

drop table transactions;

create table transactions (
	transaction_id int PRIMARY KEY auto_increment,
    amount decimal (5, 2),
    customer_id int,
    foreign key(customer_id) REFERENCES customers(customer_id)
);

alter table transactions 
	drop foreign key transactions_ibfk_1;
    
alter table transactions
	add constraint fk_customer_id
		foreign key (customer_id) REFERENCES customers (customer_id); 
        
delete from transactions;


alter table transactions
	auto_increment = 1000;
    
insert into transactions (amount, customer_id)
	values (4.99, 3),
    (2.89, 2),
    (3.38, 3),
    (4.99, 1);
    
delete from customers 
	where customer_id = 3;
    

insert into transactions (amount, customer_id)
	values (1.00, null);
    
insert into customers (first_name, last_name)
	values("poopy", "puff");


select * from product;

select * from customers;

select transaction_id, amount, first_name, last_name
 from transactions
	inner join customers on 
		transactions.customer_id = customers.customer_id;
        
select * from
	transactions LEFT JOIN
		customers on
			transactions.customer_id = customers.customer_id;
            
select * from 
	transactions RIGHT JOIN 
		customers on 
			transactions.customer_id = customers.customer_id;
            
select COUNT(amount) as count
	from transactions;

select MAX(amount) as maximum
	from transactions;
    
select MIN(amount) as minimum
	from transactions;
    
select AVG(amount) as average
	from transactions;

select SUM(amount) as sum
	from transactions;
    
select * from employees;

select CONCAT(first_name, " ", last_name) AS full_name
	from employees;
    

alter table employees
	add column job varchar(25) after hourly_pay;
    
update employees
	set job = "janitor"
		where employee_id = 6;
        

select * from
	employees where
		hire_date < "2023-01-5" AND job = "cook";
        
select * from employees
	where job = "cook" OR job = "cashier";
    
select * from
	employees where 
		NOT job = "Manager" AND NOT job = "engineer";
        


select * from
	employees where hire_date BETWEEN "2023-03-15" AND "2024-02-02";
    
    
select * from employees
	where job IN ("cashier", "cook", "janitor");
