CREATE DATABASE right_join;

USE right_join;

CREATE TABLE employee(employee_ID INT PRIMARY KEY,
                      Name VARCHAR(50),
                      Department_ID INT,
                      Salary INT);
INSERT INTO employee(employee_ID, Name, Department_ID, Salary) VALUES
(1, "Oliver", 101, 50000),
(2, 'Liam', 102, 60000),
(3, 'Ethan', 101, 55000),
(4, 'Noah', 103, 45000),
(5, 'Sophia', 104, 70000),
(6, "James", NULL, 48000);

CREATE TABLE Department(Department_ID INT,
                        Department_Name VARCHAR(50),
                        Department_Head VARCHAR(50),
                        Location VARCHAR(50));
INSERT INTO department(Department_ID, Department_Name, Department_Head, Location) VALUES
(101, 'IT', 'Robert', 'Bangalore'),
(102, 'HR', 'Sarah', 'Delhi'),
(103, 'Sales', 'David', 'Kolkata'),
(104, 'Finance', 'Michael', 'Mumbai'),
(105, 'Marketing', 'Emma', 'Pune'),
(106, 'Research', 'John', 'Chennai');

DROP TABLE department;

SELECT * FROM employee;
SELECT * FROM department;

SELECT *
FROM employee
RIGHT JOIN department
ON employee.Department_ID = department.Department_ID;