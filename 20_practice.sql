CREATE DATABASE shopsphere_analytics;
USE shopsphere_analytics;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    city VARCHAR(80),
    state VARCHAR(80),
    signup_date DATE NOT NULL
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(120) NOT NULL,
    category VARCHAR(60) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    cost_price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_status VARCHAR(30) NOT NULL,
    sales_channel VARCHAR(30) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    discount_pct DECIMAL(5,2) NOT NULL DEFAULT 0,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    payment_date DATE,
    payment_method VARCHAR(30) NOT NULL,
    payment_status VARCHAR(30) NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE returns (
    return_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    return_date DATE NOT NULL,
    quantity INT NOT NULL,
    return_reason VARCHAR(100) NOT NULL,
    refund_amount DECIMAL(12,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES
(1,'Aarav Sharma','aarav@example.com','Kolkata','West Bengal','2024-11-12'),
(2,'Diya Patel','diya@example.com','Mumbai','Maharashtra','2024-12-03'),
(3,'Rohan Das','rohan@example.com','Kolkata','West Bengal','2025-01-05'),
(4,'Ananya Iyer','ananya@example.com','Chennai','Tamil Nadu','2025-01-18'),
(5,'Vivaan Singh','vivaan@example.com','Delhi','Delhi','2025-02-02'),
(6,'Meera Nair','meera@example.com','Kochi','Kerala','2025-02-14'),
(7,'Ishaan Gupta','ishaan@example.com','Pune','Maharashtra','2025-02-20'),
(8,'Sara Khan','sara@example.com','Hyderabad','Telangana','2025-03-01'),
(9,'Kabir Roy','kabir@example.com','Kolkata','West Bengal','2025-03-11'),
(10,'Tara Reddy','tara@example.com','Hyderabad','Telangana','2025-03-22'),
(11,'Arjun Mehta','arjun@example.com','Ahmedabad','Gujarat','2025-04-02'),
(12,'Nisha Bose','nisha@example.com','Delhi','Delhi','2025-04-17'),
(13,'Dev Malhotra','dev@example.com','Jaipur','Rajasthan','2025-05-06'),
(14,'Priya Menon','priya@example.com','Bengaluru','Karnataka','2025-05-19'),
(15,'Aditya Sen','aditya@example.com','Kolkata','West Bengal','2025-06-01');

INSERT INTO products VALUES
(101,'Wireless Mouse','Electronics',799.00,420.00,120),
(102,'Mechanical Keyboard','Electronics',2499.00,1500.00,65),
(103,'USB-C Hub','Electronics',1799.00,950.00,80),
(104,'Running Shoes','Fashion',3299.00,1900.00,50),
(105,'Cotton T-Shirt','Fashion',699.00,280.00,200),
(106,'Denim Jeans','Fashion',1899.00,1050.00,90),
(107,'Coffee Maker','Home',3499.00,2200.00,35),
(108,'Water Bottle','Home',499.00,160.00,180),
(109,'Desk Lamp','Home',1299.00,650.00,75),
(110,'SQL for Analysts','Books',599.00,250.00,150),
(111,'Python Basics','Books',749.00,320.00,130),
(112,'Data Analytics Guide','Books',899.00,400.00,100);


INSERT INTO orders VALUES
(1001,1,'2025-01-08','Delivered','Website'),
(1002,2,'2025-01-12','Delivered','Mobile App'),
(1003,1,'2025-01-25','Delivered','Website'),
(1004,3,'2025-02-03','Delivered','Mobile App'),
(1005,4,'2025-02-10','Cancelled','Website'),
(1006,5,'2025-02-16','Delivered','Marketplace'),
(1007,2,'2025-02-22','Delivered','Website'),
(1008,6,'2025-03-04','Delivered','Mobile App'),
(1009,7,'2025-03-09','Returned','Website'),
(1010,8,'2025-03-15','Delivered','Marketplace'),
(1011,1,'2025-03-21','Delivered','Mobile App'),
(1012,9,'2025-03-28','Delivered','Website'),
(1013,10,'2025-04-02','Delivered','Mobile App'),
(1014,3,'2025-04-08','Delivered','Website'),
(1015,11,'2025-04-14','Cancelled','Marketplace'),
(1016,5,'2025-04-20','Delivered','Website'),
(1017,12,'2025-04-26','Delivered','Mobile App'),
(1018,2,'2025-05-03','Delivered','Website'),
(1019,13,'2025-05-09','Delivered','Marketplace'),
(1020,6,'2025-05-15','Returned','Mobile App'),
(1021,14,'2025-05-21','Delivered','Website'),
(1022,8,'2025-05-27','Delivered','Mobile App'),
(1023,1,'2025-06-02','Delivered','Website'),
(1024,9,'2025-06-07','Delivered','Marketplace'),
(1025,10,'2025-06-12','Delivered','Website'),
(1026,4,'2025-06-17','Delivered','Mobile App'),
(1027,15,'2025-06-21','Pending','Website'),
(1028,7,'2025-06-24','Delivered','Marketplace'),
(1029,12,'2025-06-27','Delivered','Website'),
(1030,5,'2025-06-29','Delivered','Mobile App');

INSERT INTO order_items VALUES
(1,1001,101,2,799.00,0),(2,1001,110,1,599.00,0),
(3,1002,104,1,3299.00,10),(4,1002,108,2,499.00,0),
(5,1003,102,1,2499.00,5),(6,1003,105,2,699.00,0),
(7,1004,111,2,749.00,0),(8,1004,103,1,1799.00,5),
(9,1005,107,1,3499.00,0),
(10,1006,106,1,1899.00,10),(11,1006,108,3,499.00,0),
(12,1007,101,1,799.00,0),(13,1007,112,1,899.00,0),
(14,1008,107,1,3499.00,5),(15,1008,109,1,1299.00,0),
(16,1009,104,1,3299.00,0),(17,1009,105,1,699.00,0),
(18,1010,103,2,1799.00,10),(19,1010,110,1,599.00,0),
(20,1011,102,1,2499.00,0),(21,1011,101,1,799.00,0),
(22,1012,105,3,699.00,5),(23,1012,108,2,499.00,0),
(24,1013,104,1,3299.00,15),(25,1013,106,1,1899.00,5),
(26,1014,112,2,899.00,0),(27,1014,111,1,749.00,0),
(28,1015,107,1,3499.00,0),
(29,1016,103,1,1799.00,0),(30,1016,109,2,1299.00,10),
(31,1017,110,2,599.00,0),(32,1017,112,1,899.00,0),
(33,1018,101,2,799.00,5),(34,1018,108,2,499.00,0),
(35,1019,106,2,1899.00,10),(36,1019,105,2,699.00,0),
(37,1020,107,1,3499.00,0),(38,1020,108,1,499.00,0),
(39,1021,104,1,3299.00,0),(40,1021,109,1,1299.00,0),
(41,1022,103,1,1799.00,5),(42,1022,102,1,2499.00,10),
(43,1023,111,2,749.00,0),(44,1023,110,1,599.00,0),
(45,1024,105,2,699.00,0),(46,1024,108,2,499.00,5),
(47,1025,107,1,3499.00,10),(48,1025,109,1,1299.00,0),
(49,1026,106,1,1899.00,0),(50,1026,112,2,899.00,5),
(51,1027,101,1,799.00,0),(52,1027,110,1,599.00,0),
(53,1028,104,1,3299.00,10),(54,1028,105,1,699.00,0),
(55,1029,103,1,1799.00,0),(56,1029,111,2,749.00,5),
(57,1030,102,1,2499.00,5),(58,1030,108,2,499.00,0);

INSERT INTO payments VALUES
(1,1001,'2025-01-08','UPI','Successful',2197.00),
(2,1002,'2025-01-12','Credit Card','Successful',4367.10),
(3,1003,'2025-01-25','UPI','Successful',3821.05),
(4,1004,'2025-02-03','Debit Card','Successful',3212.55),
(5,1005,'2025-02-10','UPI','Refunded',3499.00),
(6,1006,'2025-02-16','Cash on Delivery','Successful',3208.10),
(7,1007,'2025-02-22','UPI','Successful',1698.00),
(8,1008,'2025-03-04','Credit Card','Successful',4623.05),
(9,1009,'2025-03-09','UPI','Refunded',3998.00),
(10,1010,'2025-03-15','UPI','Successful',3837.20),
(11,1011,'2025-03-21','Credit Card','Successful',3298.00),
(12,1012,'2025-03-28','Cash on Delivery','Successful',2993.05),
(13,1013,'2025-04-02','Credit Card','Successful',4688.10),
(14,1014,'2025-04-08','UPI','Successful',2547.00),
(15,1015,'2025-04-14','UPI','Failed',3499.00),
(16,1016,'2025-04-20','Debit Card','Successful',4138.20),
(17,1017,'2025-04-26','UPI','Successful',2097.00),
(18,1018,'2025-05-03','UPI','Successful',2516.10),
(19,1019,'2025-05-09','Credit Card','Successful',4676.20),
(20,1020,'2025-05-15','UPI','Refunded',3998.00),
(21,1021,'2025-05-21','Credit Card','Successful',4598.00),
(22,1022,'2025-05-27','Debit Card','Successful',4013.05),
(23,1023,'2025-06-02','UPI','Successful',2097.00),
(24,1024,'2025-06-07','Cash on Delivery','Successful',2291.55),
(25,1025,'2025-06-12','Credit Card','Successful',4448.10),
(26,1026,'2025-06-17','UPI','Successful',3602.05),
(27,1027,'2025-06-21','UPI','Pending',1398.00),
(28,1028,'2025-06-24','Credit Card','Successful',3667.10),
(29,1029,'2025-06-27','UPI','Successful',3227.55),
(30,1030,'2025-06-29','Debit Card','Successful',3447.05);

INSERT INTO returns VALUES
(1,1009,104,'2025-03-18',1,'Size issue',3299.00),
(2,1020,107,'2025-05-20',1,'Damaged product',3499.00),
(3,1005,107,'2025-02-12',1,'Order cancelled before dispatch',3499.00),
(4,1010,103,'2025-03-22',1,'Product not as described',1619.10);

-- Quick validation checks
SELECT 'customers' AS table_name, COUNT(*) AS row_count FROM customers
UNION ALL SELECT 'products', COUNT(*) FROM products
UNION ALL SELECT 'orders', COUNT(*) FROM orders
UNION ALL SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL SELECT 'payments', COUNT(*) FROM payments
UNION ALL SELECT 'returns', COUNT(*) FROM returns;

#1
SELECT customer_id, customer_name, city, signup_date FROM customers WHERE city = "Kolkata";

#3
SELECT c.customer_id,
	   c.customer_name,
       COUNT(o.order_id) AS order_placed
FROM customers c 
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY 
	c.customer_id,
    c.customer_name;

#4
SELECT product_id,
	   product_name
FROM products
WHERE unit_price > 1000 AND stock_quantity < 100;

#5
SELECT
	c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id,
		 c.customer_name
HAVING total_orders > 2;

#6.
SELECT p.category,
	   SUM(oi.quantity * oi.unit_price *(1 - oi.discount_pct / 100)) AS total_revenue
FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id
INNER JOIN orders o
ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category
ORDER BY total_revenue DESC;

#7
SELECT c.customer_id, c.customer_name
FROM customers c
LEFT JOIN orders o 
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

#8
SELECT p.product_id,
	   p.product_name,
	   SUM(oi.quantity) AS total_quantity_sold
FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC LIMIT 3;

#9
SELECT 
	DATE_FORMAT(o.order_date, '%Y - %M')AS month,
    SUM(oi.quantity * oi.unit_price * 
    (1 - oi.discount_pct / 100 )
    ) AS total_revenue
FROM orders o
INNER JOIN order_items oi
	ON o.order_id = oi.order_id
GROUP BY DATE_FORMAT(o.order_date, '%Y - %M')
ORDER BY total_revenue DESC;

#10
WITH customer_spending AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(
            oi.quantity * oi.unit_price *
            (1 - oi.discount_pct / 100)
        ) AS total_spending
    FROM customers c
    INNER JOIN orders o
        ON c.customer_id = o.customer_id
    INNER JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY
        c.customer_id,
        c.customer_name
)

SELECT
    customer_id,
    customer_name,
    total_spending
FROM customer_spending
WHERE total_spending > (
    SELECT AVG(total_spending)
    FROM customer_spending
)
ORDER BY total_spending DESC;

#11
WITH product_revenue AS(
	SELECT p.product_id,
		   p.product_name,
           p.category,
           SUM(oi.quantity * oi.unit_price  *(1 - oi.discount_pct / 100)) AS total_revenue
	FROM products p
	INNER JOIN order_items oi
    ON p.product_id = oi.product_id
    INNER JOIN orders o
    ON oi.order_id = o.order_id
    GROUP BY p.product_id,
			 p.product_name,
             p.category
	),
    ranked_products AS(
		SELECT product_id,
			   product_name,
               category,
               total_revenue,
               DENSE_RANK() OVER(
               PARTITION BY category
               ORDER BY total_revenue DESC)AS product_rank
		FROM product_revenue
	)
SELECT category,
		product_id,
		product_name,
		total_revenue
FROM ranked_products
WHERE product_rank = 1
ORDER BY category;
		   
#12         
SELECT
    c.customer_id,
    c.customer_name,
    MIN(o.order_date) AS first_order_date,
    MAX(o.order_date) AS most_recent_order_date
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY c.customer_id;

#13
SELECT
	c.customer_id,
    c.customer_name,
    COUNT(DISTINCT DATE_FORMAT(o.order_date, '%Y - %m')) AS placed_orders
FROM customers c
INNER JOIN orders o
	ON c.customer_id = o.customer_id
GROUP BY 
	c.customer_id,
    c.customer_name
HAVING placed_orders >= 3
ORDER BY c.customer_id;

#14
WITH product_profit AS (
	SELECT p.product_id,
		   p.product_name,
           p.category,
           SUM(oi.quantity * oi.unit_price *(1 - oi.discount_pct / 100) - oi.quantity * p.cost_price) AS total_profit
	FROM products p
    INNER JOIN order_items oi
		ON p.product_id = oi.product_id
    INNER JOIN orders o
		ON oi.order_id = o.order_id
	WHERE o.order_status = 'Delivered'
    GROUP BY
		 p.product_id,
         p.product_name,
         p.category
),
ranked_products AS(
	SELECT
        product_id,
        product_name,
        category,
        total_profit,
        DENSE_RANK() OVER (
            PARTITION BY category
            ORDER BY total_profit DESC
        ) AS product_rank
    FROM product_profit
)
SELECT 
	product_id,
    product_name,
    category,
    total_profit,
    product_rank
FROM ranked_products
ORDER BY category, product_rank;

#15
WITH monthly_revenue AS(
	SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS month,
		SUM(oi.quantity * oi.unit_price *(1-oi.discount_pct / 100))AS total_revenue
	FROM orders o
    INNER JOIN order_items oi
    ON o.order_id = oi.order_id
    WHERE o.order_status = 'Delivered'
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
), 
revenue_comparison AS(
	SELECT 
		month,
        total_revenue,
        LAG(total_revenue) OVER(
			ORDER BY month) AS previous_month_revenue
	FROM monthly_revenue
)
SELECT 
	month,
    total_revenue,
    previous_month_revenue,
    ROUND(
			(total_revenue - previous_month_revenue)/ NULLIF (previous_month_revenue, 0)* 100, 2) AS mom_growth_percentage
FROM revenue_comparison
ORDER BY month;