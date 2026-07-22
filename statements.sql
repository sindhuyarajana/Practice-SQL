SELECT * FROM companydb.employee;

-- SELECT EmpID, salary, salary + 1000, department from companydb.employee;

SELECT * FROM companydb.employee WHERE Name LIKE '[A-C]%';
SELECT department, SUM(salary) AS TotalSalary FROM Employee GROUP BY department;

SELECT City, COUNT(EMPID) AS NumberOfEmployees FROM Employee Group by city;
SELECT department, AVG(Age) AS AverageAge FROM Employee GROUP BY Department;

SELECT City, MAX(Salary) AS MaximumSalary FROM Employee GROUP BY city;

SELECT City, SUM(Salary) AS TotalSalary FROM Employee GROUP BY City;

SELECT Department, COUNT(EmpID) AS ToatalEmployee FROM Employee GROUP BY Department HAVING COUNT(EmpID) > 2;