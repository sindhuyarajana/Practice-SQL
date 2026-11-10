CREATE DATABASE IF NOT EXISTS fintech_practice;
USE fintech_practice;

-- Drop tables if they already exist to start fresh
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS customers;

-- Create customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    signup_date DATE,
    country VARCHAR(30)
);

-- Create transactions table
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    transaction_date DATE,
    amount DECIMAL(10, 2),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert sample customers
INSERT INTO customers VALUES 
(1, 'Aarav Sharma', '2025-01-10', 'India'),
(2, 'Priya Patel', '2025-02-15', 'India'),
(3, 'John Smith', '2025-03-01', 'USA'),
(4, 'Emma Wilson', '2025-03-20', 'UK'),
(5, 'Rohan Verma', '2025-04-05', 'India');

-- Insert sample transactions
INSERT INTO transactions VALUES 
(101, 1, '2025-01-15', 1500.00, 'completed'),
(102, 1, '2025-02-10', 2500.00, 'completed'),
(103, 2, '2025-02-20', 3000.00, 'completed'),
(104, 2, '2025-03-05', 1200.00, 'failed'),
(105, 2, '2025-03-15', 4500.00, 'completed'),
(106, 3, '2025-03-10', 500.00, 'completed'),
(107, 3, '2025-03-25', 800.00, 'completed'),
(108, 4, '2025-04-01', 6000.00, 'completed'),
(109, 5, '2025-04-10', 2000.00, 'completed'),
(110, 5, '2025-04-12', 3500.00, 'completed');

WITH ranked_transactions AS (
    SELECT 
        customer_id,
        transaction_id,
        amount,
        transaction_date,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id 
            ORDER BY amount DESC
        ) AS rank_num
    FROM transactions
    WHERE status = 'completed'
)
SELECT 
    customer_id,
    transaction_id,
    amount,
    transaction_date
FROM ranked_transactions
WHERE rank_num = 1;