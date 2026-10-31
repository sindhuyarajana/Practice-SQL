CREATE DATABASE shopsphere;
USE shopsphere;

-- 1. Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    signup_date DATE
);

-- 2. Products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- 3. Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(30),
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

-- 4. Order Items table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);


-- CUSTOMERS
INSERT INTO customers VALUES
(1, 'Amit Roy', 'Durgapur', '2024-01-15'),
(2, 'Sneha Das', 'Kolkata', '2024-02-20'),
(3, 'Rahul Kumar', 'Bengaluru', '2024-03-10'),
(4, 'Priya Singh', 'Durgapur', '2024-04-05'),
(5, 'Karan Mehta', 'Mumbai', '2024-05-12'),
(6, 'Neha Gupta', 'Kolkata', '2024-06-18'),
(7, 'Arjun Verma', 'Pune', '2024-07-22'),
(8, 'Isha Sharma', 'Hyderabad', '2024-08-30');

-- PRODUCTS
INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 55000),
(102, 'Smartphone', 'Electronics', 25000),
(103, 'Headphones', 'Accessories', 3000),
(104, 'Keyboard', 'Accessories', 1500),
(105, 'Office Chair', 'Furniture', 8000),
(106, 'Desk', 'Furniture', 12000),
(107, 'Smartwatch', 'Electronics', 10000),
(108, 'Mouse', 'Accessories', 1000);

-- ORDERS
INSERT INTO orders VALUES
(1001, 1, '2025-01-10', 'Delivered'),
(1002, 2, '2025-01-15', 'Delivered'),
(1003, 3, '2025-02-05', 'Shipped'),
(1004, 1, '2025-02-18', 'Delivered'),
(1005, 4, '2025-03-02', 'Cancelled'),
(1006, 5, '2025-03-12', 'Delivered'),
(1007, 6, '2025-03-20', 'Pending'),
(1008, 2, '2025-04-08', 'Delivered'),
(1009, 3, '2025-04-15', 'Delivered'),
(1010, 7, '2025-04-22', 'Delivered'),
(1011, 5, '2025-05-05', 'Shipped'),
(1012, 4, '2025-05-18', 'Delivered');

-- ORDER ITEMS
INSERT INTO order_items VALUES
(1, 1001, 101, 1, 55000),
(2, 1001, 103, 2, 3000),
(3, 1002, 102, 1, 25000),
(4, 1002, 104, 2, 1500),
(5, 1003, 107, 1, 10000),
(6, 1003, 108, 2, 1000),
(7, 1004, 105, 1, 8000),
(8, 1004, 106, 1, 12000),
(9, 1005, 101, 1, 55000),
(10, 1006, 102, 2, 25000),
(11, 1006, 103, 1, 3000),
(12, 1007, 104, 3, 1500),
(13, 1008, 107, 2, 10000),
(14, 1008, 108, 1, 1000),
(15, 1009, 101, 1, 55000),
(16, 1010, 105, 2, 8000),
(17, 1011, 106, 1, 12000),
(18, 1012, 102, 1, 25000);

#1
SELECT
	customer_id,
    customer_name,
    city
FROM customers
WHERE city = "Kolkata";

#2
SELECT 
	product_name,
    category,
    price
FROM products
WHERE price > 10000
ORDER BY price DESC;

#3
SELECT 
	status,
    COUNT(order_id)
FROM orders
GROUP BY status;
	
#4
SELECT 
	c.customer_name,
    o.order_id,
    o.order_date,
    o.status
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id; 

#5
SELECT 
	c.customer_id,
    c.customer_name,
    c.city
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

#6
SELECT 
	o.order_id,
    SUM(oi.quantity) AS total_quantity,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM orders o
INNER JOIN order_items oi
ON o.order_id = oi.order_id
WHERE o.status = 'Delivered'
GROUP BY o.order_id;

#7
SELECT 
	p.product_id,
    p.product_name,
    p.category,
    SUM(oi.quantity)AS total_quantity
FROM products p INNER JOIN order_items oi ON p.product_id = oi.product_id
				INNER JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'Delivered'
GROUP BY 
	p.product_id,
    p.product_name,
    p.category
ORDER BY total_quantity DESC LIMIT 3;