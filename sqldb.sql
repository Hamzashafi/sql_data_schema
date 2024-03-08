alter table employees
rename column phone_number to email;


alter table employees
modify column email varchar(100);


alter table employees
modify email varchar(100)
after last_name;


alter table employees
drop column email;

insert into employees
values (
1, 
"hamza",
"shafi", 
25.45, 
"2024-02-01"
);

insert into employees
values (2, "usman", "khan", 20.24, "2024-03-20"),
	   (3, "akram", "saleem", 15.20, "2023-05-15"),
       (4, "saif", "aslam", 21.43, "2023-03-15"),
       (5, "shani", "wajahat", 13.45, "2023-09-12");
       
insert into employees (employee_id, first_name, last_name)
values (6, "jack", "reacher");
       

select first_name, last_name
from employees;


select * from employees
where employee_id = 1;


select *
from employees
where hourly_pay >= 15;

select * from
employees
where hire_date <= "2023-03-15";

select * from
employees where employee_id != 2;


select * from 
employees
where hire_date is null;

select * from 
employees
where hire_date is not null;

update employees
set hourly_pay = 10.50,
hire_date = "2023-01-07"
where employee_id = 6;

update employees
set hourly_pay = 10.50,
hire_date = null
where employee_id = 6;

update employees
set hourly_pay = 10.50;

delete from employees
where employee_id = 6;

set autocommit = off;

commit;

delete from employees;

rollback;
