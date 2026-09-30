CREATE DATABASE date_function;
USE date_function;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE
);

INSERT INTO employees VALUES
(1, 'Amit Roy', 'IT', 95000, '2021-03-15'),
(2, 'Sneha Das', 'Sales', 62000, '2020-07-10'),
(3, 'Rahul Kumar', 'Data', 110000, '2019-11-25'),
(4, 'Priya Singh', 'Marketing', 48000, '2022-01-18'),
(5, 'Karan Mehta', 'Engineering', 130000, '2018-06-05'),
(6, 'Neha Gupta', 'Finance', 72000, '2023-09-12'),
(7, 'Arjun Verma', 'IT', 55000, '2024-02-20'),
(8, 'Riya Sen', 'Data', 88000, '2021-12-01'),
(9, 'Vikram Das', 'Sales', 67000, '2017-04-28'),
(10, 'Anjali Roy', 'Finance', 76000, '2022-08-14');

#USING YEAR()
SELECT employee_name,
	   joining_date,
       YEAR(joining_date) AS joining_year
FROM employees;

#USING MONTH()
SELECT employee_name,
	    joining_date,
        MONTH(joining_date) AS joining_month_number
FROM employees;

#USING DAY()
SELECT employee_name,
	   joining_date,
       DAY(joining_date) AS joining_day_number
FROM employees;

#MONTHNAME()
SELECT employee_name,
	   joining_date,
       MONTHNAME(joining_date) AS joining_month_name
FROM employees;

#DAYNAME()
SELECT employee_name,
	   joining_date,
       DAYNAME(joining_date) AS joining_weekday_name
FROM employees;

#USING SQL YEAR() + MONTH()
SELECT employee_name,
	   joining_date,
       YEAR(joining_date) AS joining_year,
       MONTH(joining_date) AS joining_month_number
FROM employees;

#USING QUARTER()
SELECT employee_name,
	   joining_date,
       QUARTER(joining_date) AS joining_quarter
FROM employees;

#USING EXTRACT()
SELECT employee_name,
       joining_date,
       EXTRACT(YEAR FROM joining_date) AS joining_year,
       EXTRACT(MONTH FROM joining_date) AS joining_month
FROM employees;

#USING DATEDIFF()
SELECT employee_name,
       joining_date,
       DATEDIFF(CURDATE(), joining_date) AS days_employed
FROM employees;

#USING TIMESTAMPDIFF() 
SELECT employee_name,
	   joining_date,
       TIMESTAMPDIFF(YEAR, joining_date, CURDATE())
FROM employees;

SELECT employee_name,
	   joining_date,
       TIMESTAMPDIFF(MONTH, joining_date, CURDATE()) AS complete_months
FROM employees;

#USING DATE_ADD()
SELECT employee_name,
	   joining_date,
       DATE_ADD(joining_date, INTERVAL 1 YEAR) AS date_after_one_year
FROM employees;