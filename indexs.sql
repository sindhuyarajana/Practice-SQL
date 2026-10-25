CREATE DATABASE index_practice;

USE index_practice;

-- Create customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    city VARCHAR(50),
    signup_date DATE
);

-- Create orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    status VARCHAR(30),
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

-- Insert customers
INSERT INTO customers
(customer_id, customer_name, email, city, signup_date)
VALUES
(1, 'Amit Roy', 'amit@example.com', 'Kolkata', '2023-01-15'),
(2, 'Sneha Das', 'sneha@example.com', 'Delhi', '2023-03-20'),
(3, 'Rahul Kumar', 'rahul@example.com', 'Mumbai', '2022-11-05'),
(4, 'Priya Singh', 'priya@example.com', 'Kolkata', '2024-02-10'),
(5, 'Karan Mehta', 'karan@example.com', 'Pune', '2022-07-18'),
(6, 'Neha Gupta', 'neha@example.com', 'Delhi', '2023-08-25'),
(7, 'Arjun Verma', 'arjun@example.com', 'Mumbai', '2024-01-12'),
(8, 'Riya Sen', 'riya@example.com', 'Kolkata', '2022-09-30'),
(9, 'Vikram Das', 'vikram@example.com', 'Pune', '2023-05-14'),
(10, 'Anjali Roy', 'anjali@example.com', 'Delhi', '2024-04-01');
-- Insert orders
INSERT INTO orders
(order_id, customer_id, order_date, amount, status)
VALUES
(101, 1, '2024-01-10', 2500, 'Delivered'),
(102, 2, '2024-01-15', 1800, 'Pending'),
(103, 3, '2024-02-05', 4200, 'Delivered'),
(104, 1, '2024-02-20', 1500, 'Shipped'),
(105, 4, '2024-03-12', 3200, 'Delivered'),
(106, 5, '2024-03-18', 900, 'Cancelled'),
(107, 6, '2024-04-02', 5100, 'Delivered'),
(108, 7, '2024-04-15', 2700, 'Pending'),
(109, 8, '2024-05-01', 3600, 'Shipped'),
(110, 9, '2024-05-10', 2200, 'Delivered'),
(111, 2, '2024-06-12', 4800, 'Delivered'),
(112, 10, '2024-06-20', 1300, 'Pending'),
(113, 3, '2024-07-05', 6500, 'Delivered'),
(114, 4, '2024-07-15', 2100, 'Shipped'),
(115, 6, '2024-08-01', 3900, 'Delivered'),
(116, 1, '2024-08-10', 1700, 'Pending'),
(117, 8, '2024-09-05', 5500, 'Delivered'),
(118, 5, '2024-09-18', 2800, 'Shipped'),
(119, 7, '2024-10-02', 4500, 'Delivered'),
(120, 9, '2024-10-15', 1600, 'Pending');

SELECT * FROM customers;
#LEVEL 1 : BASICS

#creating indexes
CREATE INDEX idx_city
ON customers(city);

SHOW INDEX FROM customers;

CREATE INDEX idx_amount
ON  orders(amount);

SHOW INDEX FROM orders;

#removing index from orders
DROP INDEX idx_amount
ON orders;