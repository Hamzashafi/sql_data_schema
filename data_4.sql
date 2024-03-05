-- stored procedure = is prepared SQL code that you can save 
-- It is great if there's a query that you write often 
-- reduces network traffic 
-- increases performance
-- secure, admin can grant permission to use
-- increases memory usage of every connection


-- call get_customers();

/* delimiter $$
create procedure get_customers()
begin
	select * from customers;
end $$
delimiter ; */

delimiter $$
create procedure find_customer(IN id INT)
begin
	select * from customers
		where customer_id = id;
end $$
delimiter ;

/* delimiter $$
create procedure find_customer(IN f_name varchar(50), l_name varchar(50))
begin
	select * from customers
		where first_name = f_name AND last_name = l_name;
end $$
delimiter ; */

call find_customer("kungfu", "panda");

call find_customer(5);

drop procedure find_customer;


-- TRIGGERS =  When an event happens, do something 
-- ex (INSERT, UPDATE, DELETE)
-- check data, handle errors, audit tables

alter table employees
add column salary decimal (10, 2) 
after hourly_pay;

update employees
set salary = hourly_pay * 2080;

create trigger before_hourly_pay_update 
before update on employees
for each row
	set NEW.salary = (NEW.hourly_pay * 2080);
    
show triggers;

update employees
set hourly_pay = 50
where employee_id = 1;

update employees 
set hourly_pay = hourly_pay + 1;

delete from employees
where employee_id = 6;

create trigger before_hourly_pay_insert
before insert on
employees
for each row
set NEW.salary = (NEW.hourly_pay * 2080);

insert into employees
values (6, "deadpool", "wolverine", 10.00, null, "janitor", "2023-04-12", 5);


create table expenses (
	expense_id int primary key,
    expense_name varchar (50),
    expense_total decimal (10, 2)
);

insert into expenses
values (1, "salaries", 0),
		(2, "supplies", 0),
        (3, "taxes", 0);
        
update expenses
set expense_total = (select SUM(salary) from employees)
where expense_name = "salaries";

create trigger after_salary_delete
after delete on employees
for each row
UPDATE expenses
set expense_total = expense_total - OLD.salary
where expense_name = "salaries";

create trigger after_salary_insert
after insert on employees
for each row 
update expenses
set expense_total = expense_total + NEW.salary
where expense_name = "salaries";

create trigger after_salary_update
after update on employees
for each row
update expenses
set expense_total = expense_total + (NEW.salary - OLD.salary)
where expense_name = "salaries";

delete from employees
where employee_id = 6;

update employees
set hourly_pay = 100
where employee_id = 1;
