

-- Create a new database
CREATE DATABASE company_database;


-- Switch to the newly created database
USE company_database;

-- Create the employee table
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    salary DECIMAL(10, 2),
    department_id INT,
    manager_id INT,
    FOREIGN KEY (department_id) REFERENCES department(department_id),
    FOREIGN KEY (manager_id) REFERENCES employee(employee_id)
);

INSERT INTO employee (employee_id, employee_name, salary, department_id, manager_id)
VALUES
    (1, 'John Doe', 50000.00, 1, 1),
    (2, 'Jane Smith', 60000.00, 1, 1),
    (3, 'Michael Johnson', 55000.00, 2, 3),
    (4, 'Emily Davis', 52000.00, 2, 3),
    (5, 'David Wilson', 48000.00, 3, 5),
    (6, 'Sarah Brown', 51000.00, 3, 5);
    
describe employee;

SHOW COLUMNS FROM employee;

select * from employee;

CREATE TABLE department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

select * from department;

INSERT INTO department (department_id, department_name)
VALUES
    (1, 'Engineering'),
    (2, 'Marketing'),
    (3, 'Finance'),
    (4, 'Human Resources');
    
-- Create the manager table
CREATE TABLE manager (
    manager_id INT PRIMARY KEY,
    manager_name VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

-- Insert rows into the manager table
INSERT INTO manager (manager_id, manager_name, department_id)
VALUES
    (1, 'John Manager', 1),
    (2, 'Jane Manager', 2),
    (3, 'Michael Manager', 3),
    (4, 'Emily Manager', 4);


select * from manager;

-- Create the projects table
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    team_member_id INT,
    FOREIGN KEY (team_member_id) REFERENCES employee(employee_id) ON DELETE CASCADE,
    FOREIGN KEY (team_member_id) REFERENCES manager(manager_id) ON DELETE CASCADE
);

-- Insert rows into the projects table
INSERT INTO projects (project_id, project_name, team_member_id)
VALUES
    (4, 'Project D', 3),   -- Michael Manager
    (5, 'Project E', 6),   -- Sarah Employee
    (6, 'Project F', 1),   -- John Manager
    (7, 'Project G', 4),   -- Emily Employee
    (8, 'Project H', 2);   -- Jane Manager

select * from employee;

select * from department;

select * from manager;

select * from projects;

-- inner Join
SELECT e.employee_name, d.department_name
FROM employee e 
JOIN 
department d 
ON 
e.department_id = d.department_id; -- join condition in which join should happen


-- left join = inner join + any additional records in the left table

SELECT e.employee_name, d.department_name
FROM employee e -- left table
LEFT JOIN 
department d -- right table 
ON 
e.department_id = d.department_id; -- join condition in which join should happen


-- right join = inner join + any additional records in the right table

SELECT e.employee_name, d.department_name
FROM employee e -- left table
RIGHT JOIN 
department d -- right table 
ON 
e.department_id = d.department_id; -- join condition in which join should happen



select e.employee_name, d.department_name, m.manager_name, p.project_name
from employee e LEFT JOIN department d
ON e.department_id = d.department_id
JOIN manager m
ON m.manager_id = e.manager_id
LEFT JOIN projects p
ON p.team_member_id = e.employee_id
