CREATE DATABASE string_practice;
USE string_practice;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    department VARCHAR(50),
    job_title VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(50)
);

INSERT INTO employees VALUES
(101, '  Rahul', 'Sharma', 'rahul.sharma@gmail.com', 'IT', 'Data Analyst', '9876543210', 'Kolkata'),
(102, 'PRIYA', '  Singh ', 'PRIYA.SINGH@YAHOO.COM', 'Finance', 'Financial Analyst', '9123456780', 'Mumbai'),
(103, 'Amit', 'Kumar', 'amit.kumar@gmail.com', 'IT', 'Software Engineer', '9988776655', 'Delhi'),
(104, ' sneha ', 'Das', 'sneha.das@outlook.com', 'Marketing', 'Marketing Executive', '9012345678', 'Kolkata'),
(105, 'Karan', 'MEHTA', 'karan.mehta@gmail.com', 'Engineering', 'Data Engineer', '8899776655', 'Pune'),
(106, 'Neha', 'Gupta', 'neha.gupta@yahoo.com', 'HR', 'HR Executive', '9876501234', 'Chennai'),
(107, 'Arjun', 'Verma', 'arjun.verma@gmail.com', 'IT', 'Business Analyst', '8765432109', 'Bangalore'),
(108, 'Riya', 'Patel', 'riya.patel@outlook.com', 'Finance', 'Accountant', '9988001122', 'Ahmedabad'),
(109, 'Vikram', 'Rao', 'vikram.rao@gmail.com', 'Engineering', 'Machine Learning Engineer', '9090909090', 'Hyderabad'),
(110, 'ANANYA', 'Roy', 'ananya.roy@yahoo.com', 'Marketing', 'Digital Marketing Manager', '8080808080', 'Kolkata'),
(111, '  Suman', '  Dasgupta', 'suman.dasgupta@gmail.com', 'IT', 'Database Administrator', '7894561230', 'Delhi'),
(112, 'Pooja ', 'Nair ', 'pooja.nair@outlook.com', 'HR', 'Talent Acquisition Specialist', '7654321098', 'Kochi'),
(113, 'Rohan', 'Sen', 'rohan.sen@gmail.com', 'Finance', 'Senior Financial Analyst', '9345678120', 'Kolkata'),
(114, 'Meera', 'Iyer', 'meera.iyer@yahoo.com', 'Engineering', 'Senior Software Engineer', '9234567810', 'Bangalore'),
(115, 'Dev', 'Malhotra', 'dev.malhotra@gmail.com', 'IT', 'Cloud Engineer', '8123456789', 'Mumbai');

#clean_names
SELECT employee_id,
	   TRIM(first_name) AS cleaned_first_name
FROM employees;