CREATE DATABASE null_practice;

USE null_practice;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    manager_id INT,
    primary_manager_id INT,
    backup_manager_id INT
);

INSERT INTO employees
(employee_id, employee_name, department, salary, bonus, manager_id, primary_manager_id, backup_manager_id)
VALUES
(101, 'Amit', 'IT', 95000, 10000, 201, 201, 301),
(102, 'Sneha', 'Sales', 62000, NULL, 202, NULL, 302),
(103, 'Rahul', 'Data', 110000, 15000, NULL, NULL, NULL),
(104, 'Priya', 'Marketing', 48000, NULL, 204, 204, NULL),
(105, 'Karan', 'Engineering', 130000, 20000, NULL, NULL, 305),
(106, 'Neha', 'Finance', 72000, NULL, 205, NULL, 305),
(107, 'Arjun', 'IT', 55000, 5000, 201, 201, NULL),
(108, 'Riya', 'Sales', 58000, NULL, 202, NULL, NULL),
(109, 'Vikram', 'Data', 105000, 12000, NULL, 206, 306),
(110, 'Pooja', 'Finance', 68000, NULL, NULL, NULL, NULL);


#USING COALESCE FUNCT
SELECT employee_name,
	   salary,
       COALESCE(bonus, 0) AS bonus,
       salary + COALESCE(bonus, 0) AS total_compensation
FROM employees;

#USING NULLIF FUNCT
SELECT 
    employee_name,
    salary,
    bonus,
    (bonus * 100.0) / NULLIF(salary, 0) AS bonus_percentage
FROM employees;