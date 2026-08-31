CREATE DATABASE subquery;

USE subquery;
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT,
    salary INT,
    age INT,
    city VARCHAR(50)
);
INSERT INTO Employees VALUES
(1, 'Oliver', 101, 30000, 23, 'New York'),
(2, 'Liam', 102, 45000, 21, 'Sydney'),
(3, 'Ethan', 103, 40000, 24, 'Toronto'),
(4, 'Noah', 104, 35000, 21, 'Berlin'),
(5, 'Mason', 101, 25000, 22, 'Madrid'),
(6, 'Sophia', 105, 38000, 26, 'Mumbai'),
(7, 'James', NULL, 47000, 29, 'São Paulo'),
(8, 'Emma', 106, 32000, 24, 'Tokyo'),
(9, 'Ava', 102, 52000, 27, 'Sydney'),
(10, 'Lucas', 103, 42000, 25, 'Toronto'),
(11, 'Mia', 101, 28000, 23, 'New York'),
(12, 'Henry', 105, 41000, 30, 'Mumbai');

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);
INSERT INTO Departments VALUES
(101, 'IT', 'New York'),
(102, 'HR', 'Sydney'),
(103, 'Finance', 'Toronto'),
(104, 'Marketing', 'Berlin'),
(105, 'Sales', 'Mumbai'),
(106, 'Operations', 'Tokyo'),
(107, 'Legal', 'London');

#Above Average Salary
SELECT emp_name, salary 
FROM employees 
WHERE salary > ( 
    SELECT AVG(salary) 
    FROM employees
);
#Highest-Paid Employee
SELECT emp_name, salary 
FROM employees 
WHERE salary = (
    SELECT MAX(salary) 
    FROM employees
);
#Employees from the same department as Oliver
SELECT emp_name, department_id
FROM employees
WHERE department_id = (
    SELECT department_id
    FROM employees
    WHERE emp_name = 'Oliver'
);

#Employees earning more than their departments
SELECT emp_name, department_id, salary
FROM employees e1
WHERE salary > (
    SELECT AVG(salary)
    FROM employees e2
    WHERE e2.department_id = e1.department_id
);

#Departments with above-company-average salaries
SELECT department_id, AVG(salary) AS average_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > (
    SELECT AVG(salary)
    FROM employees
);

#Employees who ear more than every employee in department 101
SELECT emp_name, salary
FROM employees
WHERE salary > ALL(
    SELECT salary 
    FROM employees
    WHERE department_id = 101
);

#Employees working in departments located in Mumbai
SELECT emp_name, department_id
FROM employees
WHERE department_id  IN (
    SELECT department_id 
    FROM departments
    WHERE location = 'Mumbai'
);

#Departments that have at least one employee
SELECT d.department_id, d.department_name
FROM departments d
WHERE EXISTS(
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);