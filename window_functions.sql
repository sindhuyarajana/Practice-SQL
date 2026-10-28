CREATE DATABASE window_functions_practice;
USE window_functions_practice;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    joining_date DATE
);

INSERT INTO employees
(employee_id, employee_name, department, salary, joining_date)
VALUES
(1, 'Amit',   'IT',          95000, '2022-01-15'),
(2, 'Sneha',  'Sales',       62000, '2023-03-10'),
(3, 'Rahul',  'IT',         110000, '2021-07-20'),
(4, 'Priya',  'HR',          48000, '2024-02-01'),
(5, 'Karan',  'Finance',    130000, '2020-11-12'),
(6, 'Neha',   'Sales',       72000, '2022-06-18'),
(7, 'Arjun',  'IT',          95000, '2023-09-05'),
(8, 'Divya',  'HR',          58000, '2021-04-22'),
(9, 'Rohit',  'Finance',     85000, '2022-12-01'),
(10,'Pooja',  'Sales',       62000, '2024-01-08'),
(11,'Vikram', 'IT',          75000, '2020-08-14'),
(12,'Ananya', 'Finance',    130000, '2023-05-25'),
(13,'Manoj',  'HR',          48000, '2022-10-30'),
(14,'Kavya',  'Sales',       90000, '2021-12-11'),
(15,'Suresh', 'IT',          85000, '2024-03-16');

SELECT * FROM employees;

CREATE TABLE monthly_sales (
    sale_id INT PRIMARY KEY,
    employee_id INT,
    sale_month DATE,
    sales_amount DECIMAL(10,2),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO monthly_sales
(sale_id, employee_id, sale_month, sales_amount)
VALUES
(1,  1,  '2025-01-01', 25000),
(2,  1,  '2025-02-01', 32000),
(3,  1,  '2025-03-01', 28000),
(4,  2,  '2025-01-01', 18000),
(5,  2,  '2025-02-01', 22000),
(6,  2,  '2025-03-01', 30000),
(7,  3,  '2025-01-01', 40000),
(8,  3,  '2025-02-01', 35000),
(9,  3,  '2025-03-01', 45000),
(10, 6,  '2025-01-01', 20000),
(11, 6,  '2025-02-01', 26000),
(12, 6,  '2025-03-01', 24000),
(13, 7,  '2025-01-01', 15000),
(14, 7,  '2025-02-01', 19000),
(15, 7,  '2025-03-01', 23000),
(16, 9,  '2025-01-01', 30000),
(17, 9,  '2025-02-01', 27000),
(18, 9,  '2025-03-01', 33000);

SELECT * FROM monthly_sales;

#LEVEL 1(BASICS OF WINDOW FUNCTIONS)
#ROW_NUMBER()
SELECT employee_name,
	   department,
       salary,
       ROW_NUMBER() OVER(
       ORDER BY salary DESC
	)AS row_num
FROM employees;

#RANK()
SELECT employee_name,
	   department,
       salary,
       RANK() OVER(
       ORDER BY salary DESC
	)AS salary_rank
FROM employees;

#DENSE_RANK()
SELECT employee_name,
	   department,
       salary,
       DENSE_RANK() OVER(
       ORDER BY salary DESC
       )AS salary_rank
FROM employees;

#PARTITION BY with ROW_NUMBER()
SELECT employee_name,
       department,
       salary,
       ROW_NUMBER() OVER(
       PARTITION BY department
       ORDER BY salary DESC
       ) AS dept_row_num
FROM employees;

#PERCENT RANK()
SELECT employee_name,
	   salary,
       PERCENT_RANK() OVER(
       ORDER BY salary DESC
       )AS percentrank
FROM employees;
