                                                                  Find employees who joined in the last quarter:
SELECT e.employee_name, d.department_name, c.company_name, e.hire_date
FROM employee e
INNER JOIN department d ON e.department_id = d.department_id
INNER JOIN companies c ON e.company_id = c.company_id
WHERE e.hire_date >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH);

                                                                  Calculate average salary per department:
SELECT d.department_name, AVG(e.salary) AS average_salary
FROM employee e
INNER JOIN department d ON e.department_id = d.department_id
GROUP BY d.department_name;

                                                                          List products with low stock:
SELECT product_name, quantity_in_stock
FROM products
WHERE quantity_in_stock < reorder_level;

                                                                            Track product sales over time:
SELECT p.product_name, o.order_date, oi.quantity, oi.unit_price
FROM products p
INNER JOIN order_items oi ON p.product_id = oi.product_id
INNER JOIN orders o ON oi.order_id = o.order_id
ORDER BY p.product_name, o.order_date;
