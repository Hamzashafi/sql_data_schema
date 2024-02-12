create table test (
	my_date date,
    my_time time,
    my_datetime datetime
    );
    
insert into test
    values (current_date(), current_time(), now()
    );
    
insert into test 
	values (current_date() + 1, null, null
);
    
select * from test;

drop table test;

create table product (
	product_id int,
    product_name VARCHAR(25) UNIQUE,
    price decimal(4, 2)
);

alter table product
	add constraint 
		UNIQUE (product_name);
        
insert into product 
VALUES
	(101, "Pommes", 3.50),
    (102, "Burger", 9.99),
    (103, "Drink", 2.99);
    
    create table product (
	product_id int,
    product_name VARCHAR(25),
    price decimal(4, 2) NOT NULL
);

alter table product
modify price DECIMAL (4, 2) NOT NULL;

insert into product 
values (104, "cookie", 0);

select * from product;

create table employees (
employee_id int,
first_name VARCHAR (50),
last_name VARCHAR (50),
hourly_pay decimal (4, 2),
hire_date date,
	constraint chk_hourly_pay check (hourly_pay >= 10.00)
);

alter table employees 
add constraint chk_hourly_pay check (hourly_pay >= 10.00);

insert into employees
values (6, "deadpool", "wolverine", 10.29, "2023-04-20");

alter table employees
drop check chk_hourly_pay;

select * from employees;

select * from product;

insert into product 
values (105,"straw", 0.00),
		(106, "napkins", 0.00),
		(107, "spoon", 0.00);
        
delete from product 
where product_id >= 104;

create table product (
	product_id int,
    product_name VARCHAR(25),
    price decimal(4, 2) DEFAULT 0
);

alter table product
	alter price set default 0;
    
insert into product (product_id, product_name)
	values (104, "straw"),
			(105, "spoon"),
			(106, "napkins");

select * from product;