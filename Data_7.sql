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


                                                -----------------------------

                                                      Filtering Orders:
SELECT item, amount
FROM ORDERS O
WHERE amount > 500;  -- Filter orders with amount above 500

                                                    Grouping and Aggregation:
SELECT item, SUM(amount) AS total_sales
FROM ORDERS O
GROUP BY item;  -- Group orders by item and calculate total sales per item

                                                        Parametric Views:
CREATE VIEW recent_orders AS
SELECT *
FROM ORDERS O
WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 1 WEEK);  -- Filter last week's orders

-- Usage:
SELECT * FROM recent_orders WHERE item = 'Headphones';  -- Filter by item within the view

                                                      Complex Joins in Views:
CREATE VIEW customer_orders AS
SELECT C.first_name, C.last_name, O.item, O.amount, S.status
FROM CUSTOMERS C
JOIN ORDERS O ON C.customer_id = O.customer_id
JOIN SHIPPING S ON O.order_id = S.order_id;  -- Join tables

-- Usage:
SELECT * FROM customer_orders WHERE status = 'Shipped';  -- Filter by shipping status

                                                                Error Handling:
DELIMITER //
CREATE PROCEDURE update_customer_age(customer_id INT, new_age INT)
/* Updates customer age with error handling */
BEGIN
  DECLARE current_age INT;
  
  SELECT age INTO current_age FROM CUSTOMERS WHERE customer_id = customer_id;
  
  IF current_age IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE = 'Customer not found';
  ELSE
    UPDATE CUSTOMERS SET age = new_age WHERE customer_id = customer_id;
  END IF;
END //
DELIMITER ;

                                                  Input Parameters:
DELIMITER //
CREATE PROCEDURE get_customer_by_id(customer_id INT)
/* Retrieves customer details based on ID */
BEGIN
  SELECT * FROM CUSTOMERS WHERE customer_id = customer_id;
END //
DELIMITER ;

-- Usage:
CALL get_customer_by_id(2);  -- Retrieve customer with ID 2


                                                  Date and Time Functions:
SELECT item, amount,
  CASE WHEN amount > 1000 THEN 'High'
       WHEN amount > 500 THEN 'Medium'
       ELSE 'Low'
  END AS price_category
FROM ORDERS O;


                                                    --------------------------


                                                        Error Handling:
DELIMITER //
CREATE PROCEDURE get_cars_by_year(
    IN year_filter INT
)
BEGIN
  SELECT * FROM cars WHERE `year` = year_filter ORDER BY make, value DESC;
  
  IF ROW_COUNT() = 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE = 'No cars found for year ' || year_filter;
  END IF;
END //
DELIMITER ;

                                                            Output Parameters:
DELIMITER //
CREATE PROCEDURE get_car_count(
    OUT total_count INT
)
BEGIN
  SELECT COUNT(*) INTO total_count FROM cars;
END //
DELIMITER ;

DECLARE car_count INT;
CALL get_car_count(@car_count);
SELECT 'Total cars:', car_count;  -- Use output parameter in a statement

                                                              Window Functions:
SELECT make, model, value,
  RANK() OVER (ORDER BY value DESC) AS value_rank
FROM cars;  -- Rank cars based on value (highest first)

                                                          Subqueries with Joins:
SELECT c.make, c.model, c.value,
  (SELECT AVG(value) FROM cars f WHERE f.make = c.make) AS average_make_value
FROM cars c;  -- Get average value for each car's make

                                                              Boolean Expressions:
SELECT * FROM cars
WHERE year >= 2019 AND (make = 'Porsche' OR make = 'Ferrari');  -- Filter cars based on year and make

                                                                      Explain Plan Analysis:
EXPLAIN SELECT COUNT(DISTINCT value)  FROM CARS;  -- Analyze query performance
