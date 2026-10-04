CREATE DATABASE cte_practice;

USE cte_practice;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE
);

INSERT INTO employees
(employee_id, employee_name, department, salary, joining_date)
VALUES
(1, 'Amit Roy', 'IT', 95000, '2021-03-15'),
(2, 'Sneha Das', 'Sales', 62000, '2022-07-10'),
(3, 'Rahul Kumar', 'Data', 110000, '2020-01-20'),
(4, 'Priya Singh', 'Marketing', 48000, '2023-05-12'),
(5, 'Karan Mehta', 'Engineering', 130000, '2019-11-01'),
(6, 'Neha Gupta', 'Finance', 72000, '2021-08-25'),
(7, 'Arjun Verma', 'IT', 55000, '2024-02-18'),
(8, 'Riya Sen', 'Data', 85000, '2022-09-05'),
(9, 'Vikram Das', 'Sales', 78000, '2020-06-14'),
(10, 'Anjali Roy', 'Marketing', 68000, '2021-12-01'),
(11, 'Suman Paul', 'Finance', 90000, '2019-04-22'),
(12, 'Pooja Sharma', 'Engineering', 105000, '2023-01-16');

SELECT * FROM employees;

WITH high_salary AS (
    SELECT employee_name,
           salary
    FROM employees
    WHERE salary > 80000
)
SELECT employee_name,
       salary
FROM high_salary;

WITH it_employees AS (
	SELECT *
    FROM employees
    WHERE department = 'IT'
)
SELECT *
FROM it_employees;

WITH employee_salary AS(
	 SELECT employee_name,
			salary,
            salary * 1.10 AS new_salary
	FROM employees
)
SELECT 
		employee_name,
		salary,
        new_salary
FROM employee_salary;

#Average salary
WITH department_salary AS(
	 SELECT department,
			AVG(salary) AS avg_salary
	FROM employees
    GROUP BY department
)
SELECT 
	department,
    avg_salary
FROM department_salary;

#Filter the CTE result
WITH department_salary AS(
	SELECT department,
		   AVG(salary) AS avg_salary
	FROM employees
    GROUP BY department
)
SELECT 
	department,
    avg_salary
FROM department_salary
WHERE avg_salary > 80000;

#COUNT employees
WITH department_count AS(
	 SELECT department,
			COUNT(employee_id) AS employee_count
	 FROM employees
     GROUP BY department
)
SELECT 
	  department,
      employee_count
FROM department_count
WHERE employee_count > 1;