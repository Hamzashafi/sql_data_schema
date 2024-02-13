-- wild card characters & _
-- used to substitute one or more characters in a string

select * from employees 
	where first_name LIKE "s%";
    
select * from employees
	where hire_date LIKE "2024%";
    
select * from employees
	where last_name LIKE "%e";
    
select * from 
	employees;
    
select * from employees
	where first_name LIKE "___za";
    
select * from employees
	where hire_date LIKE "____-03-15";
    
select * from employees
	where job LIKE "_a%";
    
-- ORDER BY

select * from employees
	order by last_name DESC;
    
select * from employees
order by first_name ASC;

select * from employees
order by hire_date DESC;

select * from transactions 
order by amount;

select * from transactions 
order by amount , customer_id;


-- LIMIT clause is used to limit the number of records
-- useful if we are working with lot of data
-- can be used to display a large number of data on pages (PAGINATION)

select * from customers 
order by last_name DESC limit 3;

select * from customers
limit 20, 10;


-- UNION combined the results of two or more SELECT statements

create table income (
income_name varchar(50),
amount decimal (6, 2)
);

INSERT INTO income (income_name, amount)
VALUES ('Salary', 5000.00),
       ('Bonus', 1000.50),
       ('Investment', 250.75);
       
create table expenses (
	expense_name varchar(50),
    amount int
);

INSERT INTO expenses (expense_name, amount)
VALUES ('Rent', 1000),
       ('Groceries', 200),
       ('Utilities', 150);
       
select * from customers;

insert into customers
	values(5, "hamza", "shafi");

select first_name, last_name from employees
UNION ALL
select first_name, last_name from customers;

delete from customers 
where customer_id = 5;

select * from customers;