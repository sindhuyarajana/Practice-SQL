CREATE database case_when;
USE case_when;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE
);

INSERT INTO employees (employee_id, employee_name, department, salary, joining_date) VALUES
(1, 'Amit Roy', 'IT', 95000, '2021-03-10'),
(2, 'Sneha Das', 'Sales', 62000, '2020-07-15'),
(3, 'Rahul Kumar', 'Data', 110000, '2019-01-20'),
(4, 'Priya Singh', 'Marketing', 48000, '2022-05-05'),
(5, 'Karan Mehta', 'Engineering', 130000, '2018-11-01'),
(6, 'Neha Gupta', 'Finance', 72000, '2021-09-12'),
(7, 'Arjun Verma', 'IT', 55000, '2023-02-01'),
(8, 'Pooja Sharma', 'HR', 42000, '2022-08-20'),
(9, 'Vikram Joshi', 'Sales', 98000, '2020-04-18'),
(10, 'Anita Bose', 'Data', 85000, '2021-06-30');

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    status VARCHAR(50)
);

INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES
(1, 101, '2025-12-01', 1200.50, 'Pending'),
(2, 102, '2025-12-02', 3500.00, 'Shipped'),
(3, 103, '2025-12-03', 6200.75, 'Delivered'),
(4, 101, '2025-12-04', 1800.25, 'Cancelled'),
(5, 104, '2025-12-05', 950.00, 'Pending'),
(6, 105, '2025-12-06', 4700.80, 'Shipped'),
(7, 102, '2025-12-07', 2100.00, 'Delivered'),
(8, 103, '2025-12-08', 5500.60, 'Delivered'),
(9, 106, '2025-12-09', 3200.40, 'Pending'),
(10, 104, '2025-12-10', 800.00, 'Cancelled'),
(11, 107, '2025-12-11', 15000.00, 'Delivered'),
(12, 108, '2025-12-12', 2500.00, 'Shipped');

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    marks INT,
    attendance_percent DECIMAL(5,2)
);

INSERT INTO students (student_id, student_name, marks, attendance_percent) VALUES
(1, 'Rohan Das', 82, 92.50),
(2, 'Meera Sen', 68, 78.00),
(3, 'Aryan Roy', 45, 65.00),
(4, 'Isha Paul', 38, 70.50),
(5, 'Kabir Bose', 91, 95.00),
(6, 'Diya Nair', 54, 88.00),
(7, 'Aditya Rao', 72, 74.00),
(8, 'Sara Khan', 29, 60.00),
(9, 'Nikhil Das', 88, 91.00),
(10, 'Tina Singh', 61, 76.50);

SELECT student_name,
       marks,
       CASE 
           WHEN marks >= 75 THEN 'Distinction'
           WHEN marks >= 40 THEN 'Pass'
           ELSE 'Fail'
		END AS label_marks
FROM students;

#creating salary_level
SELECT  employee_name,
		salary,
        CASE 
			WHEN salary >= 100000 THEN 'High'
            WHEN salary >= 50000 THEN 'Medium'
            ELSE 'Low'
		END AS salary_level
FROM employees;

#displaying order_status_label
SELECT customer_id,
		status,
        CASE 
			WHEN status = 'Delivered' THEN 'Completed'
            WHEN status = 'Pending' OR status = 'Shipped' THEN 'In Progress'
            WHEN status = 'Cancelled' THEN 'Cancelled'
            ELSE 'Other'
		END AS order_status_label
FROM orders;

#counting total number of orders
SELECT
    SUM(CASE WHEN status = 'Delivered' THEN 1 ELSE 0 END) AS delivered_orders,
    SUM(CASE WHEN status = 'Pending' THEN 1 ELSE 0 END) AS pending_orders,
    SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_orders,
    COUNT(*) AS total_orders
FROM orders;

#labeling departments
SELECT department,
	CASE 
		WHEN department IN ('IT','Data', 'Engineering') THEN 'Technical'
        WHEN department IN ('Sales', 'Marketing', 'Finance') THEN 'Business'
        ELSE 'Other'
	END AS Label_department
FROM employees;

#applying discounts
SELECT amount,
	CASE 
		WHEN amount >= 5000 THEN '20% Discount'
        WHEN amount >= 2000 THEN '10% Discount'
        ELSE 'No Discount'
	END AS Discount
FROM orders;