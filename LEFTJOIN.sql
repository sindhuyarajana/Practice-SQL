CREATE database join_practice;

USE join_practice;

CREATE TABLE Employee(
EmpID INT PRIMARY KEY,
Name VARCHAR(50),
Country VARCHAR(50),
Age INT,
Salary INT,
Department_id INT);

INSERT INTO Employee (EmpID, Name, Country, Age, Salary, Department_id) VALUES
(1, 'Oliver', 'USA', 23, 30000, 101),
(2, 'Liam', 'Australia', 21, 45000, 102),
(3, 'Ethan', 'Canada', 24, 40000, 103),
(4, 'Noah', 'Germany', 21, 35000, 104),
(5, 'Mason', 'Spain', 22, 25000, 101),
(6, 'Sophia', 'India', 26, 38000, 105),
(7, 'James', 'Brazil', 29, 47000, NULL),
(8, 'Emma', 'Japan', 24, 32000, 106);

CREATE TABLE Department(
Department_id INT,
Department_name VARCHAR(50),
Department_head VARCHAR(50),
Location VARCHAR(50)
);

INSERT INTO Department (Department_id,Department_name, Department_head, Location) VALUES
(101, 'Sales', 'Sarah', 'New york'),
(102, 'Marketing', 'Jay', 'London'),
(103, 'Finance', 'Lavish', 'San francisco'),
(104, 'Engineering', 'Kabir', 'Bangalore'),
(107, 'HR', 'Anita', 'Delhi'),
(108, 'Support', 'Rahul', 'Mumbai');

SELECT employee.Name AS Employee_Name,
       department.Department_name
FROM employee
LEFT JOIN department
ON employee.Department_id = department.Department_id;

SELECT employee.Name,
       department.Department_name
FROM employee
LEFT JOIN department
ON employee.Department_id = department.Department_id
WHERE department.Department_name IS NULL;


