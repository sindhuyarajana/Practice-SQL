-- CREATE DATABASE CompanyDB;

USE CompanyDB;

CREATE TABLE Employee (
EmpID INT PRIMARY KEY,
Name VARCHAR(50),
Age INT,
Department VARCHAR(50),
Salary DECIMAL(10,2),
City VARCHAR(50)
);

INSERT INTO Employee (EmpID, Name, Age, Department, Salary, City)VALUES
(101, 'Alice',   25, 'HR',        35000, 'Kolkata'),
(102, 'Bob',     28, 'IT',        50000, 'Delhi'),
(103, 'Charlie', 30, 'Finance',   55000, 'Mumbai'),
(104, 'David',   27, 'Marketing', 42000, 'Chennai'),
(105, 'Emma',    26, 'IT',        48000, 'Hyderabad'),
(106, 'Frank',   32, 'HR',        60000, 'Bengaluru'),
(107, 'Grace',   29, 'Finance',   58000, 'Pune'),
(108, 'Henry',   31, 'IT',        62000, 'Kolkata'),
(109, 'Ivy',     24, 'Marketing', 39000, 'Delhi'),
(110, 'Jack',    35, 'Finance',   70000, 'Mumbai'),
(111, 'Kate',    28, 'HR',        45000, 'Chennai'),
(112, 'Leo',     26, 'IT',        52000, 'Hyderabad'),
(113, 'Mia',     27, 'Marketing', 43000, 'Pune'),
(114, 'Noah',    33, 'Finance',   68000, 'Bengaluru'),
(115, 'Olivia',  29, 'IT',        56000, 'Kolkata');

SELECT * FROM Employee;

