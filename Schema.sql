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


						-----------------------------


--  JOIN with filtering and aggregation:

SELECT c.first_name, c.country, o.item, SUM(o.amount) AS total_spent
FROM CUSTOMERS c
INNER JOIN ORDERS o ON c.customer_id = o.customer_id
INNER JOIN SHIPPING s ON o.order_id = s.order_id
WHERE s.status = 'Delivered' AND YEAR(o.order_date) = 2023
GROUP BY c.first_name, c.country, o.item
ORDER BY total_spent DESC;

-- Subquery with window function and filtering:

WITH top_sellers AS (
  SELECT customer_id, SUM(amount) AS total_sales
  FROM ORDERS
  GROUP BY customer_id
  ORDER BY total_sales DESC
  LIMIT 10
)
SELECT c.first_name, c.last_name, ts.total_sales
FROM CUSTOMERS c
INNER JOIN top_sellers ts ON c.customer_id = ts.customer_id;

-- User-defined function with error handling:

DELIMITER //
CREATE FUNCTION calculate_age(birth_date DATE)
RETURNS INT
BEGIN
  DECLARE age INT;
  SET age = FLOOR(DATEDIFF(CURDATE(), birth_date) / 365.25);
  
  IF age < 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE = 'Invalid birth date';
  END IF;
  
  RETURN age;
END //
DELIMITER ;

SELECT first_name, last_name, calculate_age(birth_date) AS age
FROM CUSTOMERS;

-- Common Table Expression (CTE) for recursive data processing:

WITH employee_hierarchy (employee_id, manager_id, level) AS (
  SELECT id, manager_id, 1 AS level
  FROM EMPLOYEES
  WHERE manager_id IS NULL
  UNION ALL
  SELECT e.id, e.manager_id, h.level + 1
  FROM EMPLOYEES e
  INNER JOIN employee_hierarchy h ON e.manager_id = h.employee_id
)
SELECT e.first_name, e.last_name, h.level
FROM EMPLOYEES e
INNER JOIN employee_hierarchy h ON e.id = h.employee_id
ORDER BY h.level;
