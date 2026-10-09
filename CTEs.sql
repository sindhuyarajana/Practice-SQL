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

#TWO CTEs
WITH department_salary AS(
	 SELECT department,
		    AVG(salary) AS avg_salary
	FROM employees
    GROUP BY department
), 
high_salary_department AS(
	 SELECT department,
			avg_salary
	 FROM department_salary
     WHERE avg_salary > 80000
)
SELECT *
FROM high_salary_department;

#Two_Step_Employee_Analysis
WITH high_salary_employees AS(
	 SELECT department,
			employee_id,
			salary
	 FROM employees
     WHERE salary > 70000
),
number_of_employees AS(
	SELECT department,
		   COUNT(employee_id) AS employee_count
	FROM high_salary_employees
    GROUP BY department
)
SELECT department,
		employee_count
FROM number_of_employees;

#Two step Salary Analysis
WITH average_salary AS(
	SELECT department,
			AVG(salary) AS avg_salary
	FROM employees
    GROUP BY department
),
department_salary AS (
	SELECT department,
			avg_salary
	FROM average_salary
    WHERE avg_salary > 70000
)
SELECT
	department,
    avg_salary
FROM department_salary
ORDER BY avg_salary DESC;

#above department average
WITH department_avg AS (
    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
)
SELECT
    e.employee_name,
    e.department,
    e.salary,
    d.avg_salary
FROM employees e
JOIN department_avg d
    ON e.department = d.department
WHERE e.salary > d.avg_salary;

#salary above overall average
WITH overall_average AS (
    SELECT
        AVG(salary) AS avg_salary
    FROM employees
)
SELECT
    e.employee_name,
    e.salary
FROM employees e
CROSS JOIN overall_average a
WHERE e.salary > a.avg_salary;

#Department With Highest Average Salary
WITH highest_average_salary AS(
	SELECT department,
			AVG(salary) as avg_salary
	FROM employees
    GROUP BY department
)
SELECT department,
		avg_salary
FROM highest_average_salary
ORDER BY avg_salary DESC LIMIT 1;

#Employee Count + Average Salary
WITH for_each_department AS(
	SELECT department,
			COUNT(employee_id) AS employee_count,
            AVG(salary) AS avg_salary
	FROM employees
    GROUP BY department
)
SELECT *
FROM for_each_department
WHERE employee_count > 1 AND avg_salary > 70000;

#Highest Paid Employee in Each Department
WITH highest_paid AS(
	 SELECT department,
            MAX(salary) AS max_salary
	FROM employees
    GROUP BY department
)
SELECT 
	e.employee_name,
    e.department,
    e.salary
FROM employees e
JOIN highest_paid h
ON e.department = h.department AND
	e.salary = h.max_salary;

#Departments With No Low-Salary Employees
WITH department_salary AS(
	SELECT department,
		   MIN(salary) AS minimum_salary
	FROM employees
    GROUP BY department
)
SELECT department,
		minimum_salary
FROM department_salary
WHERE minimum_salary > 60000;

#salary ranking by department
WITH department_average AS(
	SELECT department,
			AVG(salary) AS avg_salary
	FROM employees
    GROUP BY department
)
SELECT e.employee_name,
		e.department,
        e.salary,
        d.avg_salary
FROM employees e
JOIN department_average d 
ON e.department = d.department
WHERE e.salary >= d.avg_salary * 1.10;

#department salary difference
WITH department_avg AS (
    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
)
SELECT
    e.employee_name,
    e.department,
    e.salary,
    d.avg_salary,
    e.salary - d.avg_salary AS salary_difference
FROM employees e
JOIN department_avg d
    ON e.department = d.department;

#TWO-level Filtering
WITH department_average AS(
	  SELECT department,
			 AVG(salary) AS avg_salary
	  FROM employees
      GROUP BY department
), average_salary AS (
		SELECT department,
			   avg_salary
		FROM department_average
        WHERE avg_salary > 70000
)
SELECT e.employee_name,
	   e.department,
       e.salary,
       a.avg_salary
FROM employees e
JOIN average_salary a 
ON e.department = a.department
WHERE e.salary > 80000;
	