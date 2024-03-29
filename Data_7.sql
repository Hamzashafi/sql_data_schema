                                                         Fetching Employee Details and Company Information

SELECT e.employee_name, d.department_name, c.company_name, c.location
FROM employee e
INNER JOIN department d ON e.department_id = d.department_id
INNER JOIN companies c ON e.company_id = c.company_id;

                                                                        Natural Join
                                                              Grouping Employees by Department:
SELECT d.department_name, COUNT(*) AS employee_count
FROM employee e
INNER JOIN department d ON e.department_id = d.department_id
GROUP BY d.department_name;

                                                           Finding Employees Without a Department:
SELECT e.employee_name
FROM employee e
LEFT JOIN department d ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

                                                            Using Self Join for Family Hierarchy:

WITH RECURSIVE family_tree(member_id, name, age, level, path) AS (
  SELECT member_id, name, age, 0 AS level, CAST(member_id AS VARCHAR(10)) AS path
  FROM family
  WHERE parent_id IS NULL
  UNION ALL
  SELECT f.member_id, f.name, f.age, t.level + 1, CONCAT(t.path, '.', f.member_id)
  FROM family f
  JOIN family_tree t ON f.parent_id = t.member_id
)
SELECT *
FROM family_tree
ORDER BY path;

                                                       Finding Employees with Children:
SELECT e.employee_name
FROM employee e
INNER JOIN family f ON e.employee_id = f.parent_id
GROUP BY e.employee_name;


                                                    --------------------------------------

                                      Customer Orders with Shipping Status:
                                        
SELECT c.first_name AS customer_name, o.item, s.status AS shipping_status
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id
INNER JOIN Shipping s ON c.customer_id = s.customer_id;

                                          Total Order Amount per Customer:
                                            
SELECT c.customer_id, c.first_name, SUM(o.amount) AS total_order_amount
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name;

                                            Orders Placed in the Last Month:
                                              
SELECT c.first_name, o.item, o.amount, o.order_date
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

                                      Customers in a Specific Country:
SELECT *
FROM Customers
WHERE country = 'Canada';

                                            Orders Above a Certain Amount:
                                              
SELECT c.first_name, o.item, o.amount
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.amount > 1000;
