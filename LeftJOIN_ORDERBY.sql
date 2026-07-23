SELECT employee.name,
       department.department_name,
       employee.salary
FROM employee
LEFT JOIN department
ON employee.Department_id = department.Department_id
ORDER BY department.Department_name ASC,
		 employee.salary DESC;
         
SELECT employee.name,
       employee.country,
       department.department_name
FROM employee
LEFT JOIN department
ON employee.department_id = department.department_id
ORDER BY employee.country ASC;