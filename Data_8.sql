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

			                                      Hierarchical Data Analysis with Recursive CTE
WITH RECURSIVE category_tree(category_id, parent_id, category_name, level) AS (
  SELECT category_id, parent_id, category_name, 0 AS level
  FROM product_categories
  WHERE parent_id IS NULL
  UNION ALL
  SELECT c.category_id, c.parent_id, c.category_name, t.level + 1
  FROM product_categories c
  JOIN category_tree t ON c.parent_id = t.category_id
)
SELECT ct.category_name, ct.level, COUNT(p.product_id) AS product_count
FROM category_tree ct
LEFT JOIN products p ON ct.category_id = p.category_id
GROUP BY ct.category_name, ct.level
ORDER BY ct.category_id;

			                              Window Functions with Ranking and Percentiles
SELECT employee_id, department_name, salary,
  RANK() OVER (ORDER BY salary DESC) AS salary_rank,
  PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY salary) AS salary_quartile
FROM employee
INNER JOIN department ON employee.department_id = department.department_id;

			                          Data Transformation and Manipulation(PIVOT Table)
SELECT customer_name,
  SUM(CASE WHEN order_month = 1 THEN order_amount ELSE 0 END) AS jan_sales,
  SUM(CASE WHEN order_month = 2 THEN order_amount ELSE 0 END) AS feb_sales,
  ...  -- Add columns for other months
FROM orders
GROUP BY customer_name
PIVOT (SUM(order_amount) FOR order_month IN (1, 2, 3, ...));

			                                            Lateral Joins for Data Unpacking
SELECT e.employee_id, e.name, skill.skill_name
FROM employee e
CROSS JOIN UNNEST(e.skills) AS skill;

			                                      Data Security and Access Control
		                                  Row Level Security (RLS) with User-Defined Functions
                                              
CREATE FUNCTION has_access(user_id INT, department_id INT)
RETURNS BOOLEAN
BEGIN
  DECLARE user_department INT;
  
  SELECT department_id INTO user_department FROM users WHERE user_id = user_id;
  
  RETURN user_department = department_id;
END;

CREATE VIEW v_restricted_data AS
SELECT * FROM sensitive_data
WHERE has_access(CURRENT_USER, department_id);

GRANT SELECT ON v_restricted_data TO role_sales;
