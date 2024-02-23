-- FULL JOIN = Inner Join
-- + all remaining records from Left Table (returns null value for any columns fetch)
-- + all remaining records from Right Table (return null value for any columns fetch)

-- SELECT e.employee_name, d.department_name
-- FROM employee e 
-- FULL OUTER JOIN department d
-- ON d.department_id = e.department_id

SELECT e.employee_name, d.department_name
FROM employee e LEFT JOIN department d 
ON d.department_id = e.department_id
UNION
SELECT e.employee_name, d.department_name
FROM employee e RIGHT JOIN department d 
ON d.department_id = e.department_id;


-- CROSS JOIN
-- Cross join returns cartesian product.

SELECT e.employee_name, d.department_name
FROM employee e 
CROSS JOIN department d;

CREATE TABLE companies (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(100),
    location VARCHAR(100)
);

INSERT INTO companies (company_id, company_name, location)
VALUES
    (1, 'ABC Corp', 'New York'),
    (2, 'XYZ Inc', 'Los Angeles'),
    (3, '123 Industries', 'Chicago');
    
-- write a query to fetch the employee name and thier corresponding department name.
-- also make sure to display the company name and the company location corresponding to each employee.


select e.employee_name, d.department_name, c.company_name, c.location
from employee e JOIN department d
ON e.department_id = d.department_id
CROSS JOIN companies c;


-- Natural JOIN

select e.employee_name, d.department_name
from employee e NATURAL JOIN department d;

select * from department;

alter table department
rename column department_id to id;


-- SELF JOIN

CREATE TABLE family (
    member_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    parent_id INT,
    FOREIGN KEY (parent_id) REFERENCES family(member_id)
);

-- Insert rows into the family table
INSERT INTO family (member_id, name, age, parent_id)
VALUES
    (1, 'John', 40, NULL),    -- John is a parent
    (2, 'Jane', 38, NULL),    -- Jane is a parent
    (3, 'Michael', 18, 1),    -- Michael is the child of John
    (4, 'Emily', 16, 1),      -- Emily is the child of John
    (5, 'David', 20, 2),      -- David is the child of Jane
    (6, 'Sarah', 15, 2),      -- Sarah is the child of Jane
    (7, 'Olivia', 10, 3),     -- Olivia is the child of Michael
    (8, 'Daniel', 8, 4);      -- Daniel is the child of Emily
    
select * from family;

-- write a query to fetch the child name and their age corresponding to their parent name and parent ages

select child.name as child_name, child.age as child_age,
parent.name as parent_name, parent.age as parent_age
from family as child
JOIN family as parent
ON child.parent_id = parent.member_id; -- conditions on which join should happen


                                            -----------------------------------------------

-- JOIN two or more tables

-- Create the webstore database
CREATE DATABASE webstore;

-- Switch to the webstore database
USE webstore;

-- Create the Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    country VARCHAR(50)
);

-- Create the Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    item VARCHAR(100),
    amount DECIMAL(10, 2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create the Shipping table
CREATE TABLE Shipping (
    shipping_id INT PRIMARY KEY,
    status VARCHAR(50),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);


-- Insert into Customers table
INSERT INTO Customers (customer_id, first_name, last_name, age, country)
VALUES
    (1, 'John', 'Doe', 30, 'USA'),
    (2, 'Alice', 'Smith', 25, 'Canada'),
    (3, 'Bob', 'Johnson', 35, 'UK'),
    (4, 'Emily', 'Brown', 28, 'Australia');

-- Insert into Orders table
INSERT INTO Orders (order_id, item, amount, customer_id)
VALUES
    (101, 'Laptop', 1200.50, 1),
    (102, 'Smartphone', 800.75, 2),
    (103, 'Tablet', 400.20, 3),
    (104, 'Headphones', 150.99, 1);

-- Insert into Shipping table
INSERT INTO Shipping (shipping_id, status, customer_id)
VALUES
    (201, 'Shipped', 1),
    (202, 'Pending', 2),
    (203, 'Delivered', 3),
    (204, 'Processing', 4);
    
select * from Customers;

select * from Orders;

select * from shipping;

SELECT Customers.first_name, Orders.item, Shipping.status
FROM Customers
JOIN Orders ON Customers.customer_id = Orders.customer_id
JOIN Shipping 
    ON Customers.customer_id = Shipping.customer_id; -- join condition on which join should happens


            ----------------------- -----------------------------


use webstore;

select * from customers;

select * from orders;

-- join Customers and Orders tables with their matching fields customer_id

SELECT C.customer_id, O.item
FROM Customers as C
JOIN Orders as O
ON C.customer_id = O.customer_id;


SELECT C.LAST_NAME , C.AGE, O.ORDER_ID , O.AMOUNT 
from Customers as C
JOIN Orders as O
ON C.customer_id = O.customer_id;


-- left join Customers and Orders tables based on their shared customer_id columns
-- Customers is the left table
-- Orders is the right table

SELECT C.customer_id, C.first_name, O.amount
FROM CUSTOMERS C LEFT JOIN ORDERS O 
ON C.CUSTOMER_ID = O.CUSTOMER_ID;


-- join Customers and Orders tables
-- based on their shared customer_id columns
-- Customers is the left table
-- Orders is the right table

SELECT C.CUSTOMER_ID , C.FIRST_NAME  , O.AMOUNT 
FROM CUSTOMERS C 
RIGHT JOIN ORDERS O 
ON C.CUSTOMER_ID = O.CUSTOMER_ID;




-- full join Customers and Orders tables
-- based on their shared customer_id columns
-- Customers is the left table
-- Orders is the right table

-- SELECT C.FIRST_NAME, C.AGE, O.AMOUNT, O.ITEM 
-- from CUSTOMERS C 
-- FULL JOIN ORDERS O 
-- ON C.CUSTOMER_ID = O.CUSTOMER_ID;

SELECT C.CUSTOMER_ID , C.FIRST_NAME , O.AMOUNT 
FROM CUSTOMERS C 
LEFT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
UNION
SELECT C.CUSTOMER_ID , C.FIRST_NAME , O.AMOUNT 
FROM CUSTOMERS C 
RIGHT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;


CREATE TABLE shippingbck
AS
SELECT * from shipping;

-- BACKUP DATABASE webstore
-- TO DISK = 'D:\my_db_backup.bak';

-- mysqldump -u hamza -p webstore > "D:\my_db_backup.sql"


                                        ------------------------------------ 


-- create a table with unique constraint
CREATE TABLE Colleges (
  college_id INT NOT NULL UNIQUE,
  college_code VARCHAR(20) UNIQUE,
  college_name VARCHAR(50)
);

-- insert values to Colleges table
INSERT INTO Colleges(college_id, college_code, college_name)
VALUES (1, "ARD12", "Star Public School"), (2, "ARD13", "Galaxy School");

SELECT * from COLLEGES ;

ALTER Table COLLEGES 
DROP CONSTRAINT college_id_3;

ALTER Table COLLEGES 
ADD UNIQUE(college_id);


-- this table doesn't have a foreign key
CREATE TABLE Users (
  id INT PRIMARY KEY,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  age INT,
  country VARCHAR(10)
);

-- add foreign key to buyer and seller fields
-- foreign key references the id field of the Users table
CREATE TABLE Transactions (
  transaction_id INT PRIMARY KEY,
  amount INT,
  seller INT,
  buyer INT,
  CONSTRAINT fk_seller FOREIGN KEY (seller) REFERENCES Users(id),
  CONSTRAINT fk_buyer FOREIGN KEY (buyer) REFERENCES Users(id)
);



-- ADDING CONSTRAINT ON COLLEGE TABLE COLUMN

ALTER TABLE COLLEGES 
ALTER college_name SET DEFAULT 'SIR SYED';


INSERT INTO COLLEGES (college_id, college_code)
VALUES (3, 'ARD14');

SELECT * FROM COLLEGES;


-- create index on COLLEGE TABLE

CREATE Index college_index
ON colleges(college_code);

SELECT * FROM COLLEGES;

SELECT GETDATE();

-- current TIME METHOD
SELECT CURRENT_TIMESTAMP();

-- date difference method
SELECT DATEDIFF(month, '2020-12-31 23:59:59', '2022-01-01 00:00:00');


SELECT * from ORDERS O 

-- Addition Operator
SELECT item, amount, amount+200 AS total_amount
from ORDERS O 

-- Subtraction Operator
SELECT item, amount, amount-400 AS discount_price
from ORDERS O 


-- remainder
SELECT 10 % 3 AS result;

-- CREATING VIEWS

CREATE view us_customer AS
SELECT first_name, last_name, age
FROM CUSTOMERS;

-- updating view
CREATE or REPLACE view us_customer AS
select * from CUSTOMERS 
WHERE country = 'USA';

SELECT * from US_CUSTOMER UC 

select * from ORDERS O 

CREATE view customer_order_details as 
SELECT C.first_name, C.age, C.country, O.item, O.amount 
from CUSTOMERS C 
JOIN 
ORDERS O 
ON C.customer_id = O.customer_id;


SELECT * FROM CUSTOMER_ORDER_DETAILS COD ;

select * from CUSTOMERS C 

-- Procedure SQL


SHOW CREATE PROCEDURE us_customer();
