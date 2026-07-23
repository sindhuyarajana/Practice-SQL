SELECT department.Department_name,
       COUNT(*) AS Number_of_Employees
FROM employee
LEFT JOIN department
ON employee.Department_id = department.Department_id
GROUP BY department.Department_name;

SELECT department.department_name,
       AVG(employee.salary) AS AVG_Salary
FROM employee
LEFT JOIN department
ON employee.department_id = department.Department_id
GROUP BY department.Department_name;