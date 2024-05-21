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


                                                                                    ------------------------
                                                                      Find the top 10 most visited pages on a website: (Analysis)
SELECT page_url, COUNT(*) AS visit_count
FROM website_traffic
GROUP BY page_url
ORDER BY visit_count DESC
LIMIT 10;

                                                                            Calculate the average order value by customer
SELECT c.customer_name, AVG(o.amount) AS average_order_value
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

                                                              Use a Common Table Expression (CTE) to calculate total sales per year
WITH yearly_sales AS (
  SELECT YEAR(order_date) AS order_year, SUM(amount) AS total_sales
  FROM orders
  GROUP BY YEAR(order_date)
)
SELECT * FROM yearly_sales;

                                                                Use JOINs with aggregates to find the highest-earning department:
SELECT d.department_name, SUM(e.salary) AS total_department_salary
FROM employee e
INNER JOIN department d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY total_department_salary DESC
LIMIT 1;
