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