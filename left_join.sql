USE office;

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
(5, 'Mason', 'Spain', 22, 25000, 101);

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
(104, 'Engineering', 'Kabir', 'Bangalore');

SELECT Employee.empid,
       employee.name,
       department.department_name,
       department.department_head,
       department.location
FROM employee
INNER JOIN Department
ON employee.department_id = department.department_id;

SELECT Employee.empid,
       employee.name,
       department.department_name,
       department.department_head,
       department.location
FROM employee
INNER JOIN Department
ON employee.department_id = department.department_id
WHERE department.location = 'London';

SELECT employee.EmpID, employee.Name, department.department_name, 
department.department_head, department.location 
FROM Employee
LEFT JOIN department ON 
employee.department_id = department.department_id;

SELECT employee.empid,
       employee.Name,
       department.department_name
FROM employee
LEFT JOIN department
ON employee.department_id = department.Department_id;

SELECT employee.EmpID,
       employee.name,
       department.Department_name
FROM employee
LEFT JOIN department
ON employee.Department_id = department.Department_id;

SELECT employee.Name,
       employee.Country,
       department.Department_name
FROM employee
LEFT JOIN department
ON employee.department_id = department.Department_id;

SELECT employee.name,
	   department.Department_head
FROM employee
LEFT JOIN Department
ON employee.Department_id = department.Department_id;

SELECT employee.name,
       department.Location
FROM employee
LEFT JOIN department
ON employee.Department_id = department.Department_id;

SELECT employee.name,
       employee.salary,
       department.department_name
FROM employee
LEFT JOIN department
ON employee.Department_id = department.Department_id
ORDER BY employee.salary DESC;

SELECT employee.name,
       employee.salary,
       department.Department_name
FROM employee
LEFT JOIN department
ON employee.Department_id = department.Department_id
WHERE department.Department_name = 'sales';

SELECT employee.name,
	    employee.Country,
        department.Department_name
FROM employee
LEFT JOIN department
ON employee.Department_id = department.Department_id
WHERE department.location = 'London';

SELECT employee.name,
employee.salary,
department.Department_name
FROM Employee
LEFT JOIN department
ON employee.Department_id  = department.Department_id
WHERE employee.Salary > 30000;

SELECT employee.Department_id, employee.name, department.Department_name, department.Department_head,department.location
FROM employee LEFT JOIN department ON employee.Department_id = department.Department_id
WHERE Employee.country = 'USA';

SELECT employee.name,
       department.department_head
FROM employee
LEFT JOIN department
ON employee.Department_id = department.Department_id
WHERE department.Department_head = 'Kabir';