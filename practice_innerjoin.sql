-- CREATE DATABASE School;

USE School;

CREATE TABLE Professor(
id INT PRIMARY KEY,
Name VARCHAR(50),
Salary INT);

INSERT INTO Professor(ID, Name, Salary)VALUES
(1, 'Rohan Kumar', 57000),
(2, 'Hiroshi Tanaka', 45000),
(3, 'Maria Fernandez', 60000),
(4, 'Ahmed Hassan', 50000),
(5, 'Elena Petrova', 55000);

SELECT * FROM Professor;

CREATE TABLE Teacher(
Course_id INT,
Prof_id INT,
Course_name VARCHAR(50));

INSERT INTO Teacher(Course_id, Prof_id, Course_name)VALUES
(1, 1, 'English'),
(1, 3, 'Physics'),
(2, 4, 'Chemistry'),
(2, 5, 'Mathematics');

SELECT * FROM Teacher;

SELECT professor.name, professor.salary, teacher.course_name FROM professor INNER JOIN teacher ON professor.id = teacher.prof_id WHERE professor.salary > 55000;

SELECT professor.id,
professor.name,
teacher.course_name 
FROM professor
INNER JOIN Teacher ON professor.id = teacher.prof_id
WHERE teacher.course_name = "physics";

SELECT professor.name,
	   professor.salary,
       teacher.course_name
FROM professor
INNER JOIN teacher
ON professor.id = teacher.prof_id
WHERE professor.salary < 55000;

SELECT professor.name,
       teacher.course_id,
       teacher.course_name
FROM professor
INNER JOIN teacher
ON professor.id = teacher.prof_id
WHERE teacher.course_id = 2;

SELECT professor.name,
       professor.salary,
       teacher.course_name
FROM professor
INNER JOIN teacher
ON professor.id = teacher.prof_id
WHERE teacher.course_name = 'mathematics';

SELECT Professor.name,
	   Teacher.course_name,
       professor.salary
FROM professor
INNER JOIN teacher
ON professor.id = teacher.prof_id
ORDER BY Professor.salary DESC;

SELECT professor.name,
	   professor.salary
FROM professor
INNER JOIN teacher
ON professor.id = teacher.prof_id
ORDER BY professor.name ASC;

SELECT professor.name,
       teacher.course_name
FROM professor
INNER JOIN teacher
ON professor.id = teacher.prof_id
ORDER BY teacher.course_name;

SELECT COUNT(professor.id) AS Total_professors
FROM professor
INNER JOIN teacher
ON professor.id = teacher.prof_id;

SELECT AVG(professor.salary) AS AVG_salary 
FROM Professor
INNER JOIN teacher
ON professor.id = teacher.prof_id;

SELECT professor.name,
       professor.salary
FROM professor
INNER JOIN teacher
ON professor.id = teacher.prof_id
WHERE professor.salary = (SELECT MAX(professor.salary)
                          FROM professor
                          INNER JOIN teacher
                          ON professor.id = teacher.prof_id);
                          
SELECT professor.name,
       professor.salary
FROM professor
INNER JOIN teacher
ON professor.id = teacher.prof_id
WHERE professor.salary = (SELECT MIN(professor.salary)
                         FROM professor
                         INNER JOIN teacher
                         ON professor.id = teacher.prof_id);
                         
SELECT SUM(professor.salary) AS total_salary
FROM professor
INNER JOIN teacher
ON professor.id = teacher.prof_id;


SELECT teacher.course_id,
       COUNT(professor.id) AS Total_Professors
FROM professor
INNER JOIN teacher
ON professor.id = teacher.prof_id
GROUP BY teacher.course_id;

SELECT teacher.course_id,
	   AVG(professor.salary) AS AVG_Sal
FROM Professor
INNER JOIN teacher
ON professor.id = teacher.prof_id
GROUP BY teacher.course_id;

SELECT teacher.course_id,
       MAX(professor.salary) AS max_sal
FROM professor
INNER JOIN teacher
ON professor.id = teacher.prof_id
GROUP BY teacher.course_id;

SELECT teacher.course_id,
       MIN(professor.salary) AS min_sal
FROM professor
INNER JOIN teacher
ON professor.id = teacher.prof_id
GROUP BY teacher.course_id;


SELECT teacher.course_name,
       MAX(professor.salary) AS highest_Salary
FROM professor
INNER JOIN teacher
ON professor.id = teacher.prof_id
GROUP BY teacher.course_name;

SELECT professor.name,
       teacher.course_name
FROM professor
INNER JOIN teacher
ON professor.id = teacher.prof_id
WHERE professor.name LIKE 'M%';

SELECT professor.name,
       teacher.course_name
FROM professor
INNER JOIN teacher
ON professor.id = teacher.prof_id
WHERE professor.name LIKE '%a%';

SELECT UPPER(professor.name),
       teacher.course_name
FROM professor
INNER JOIN teacher
ON professor.id = teacher.prof_id;

SELECT LENGTH(professor.name) AS len_of_prof_name,
       teacher.course_name
FROM professor
INNER JOIN teacher
ON professor.id = teacher.prof_id;

SELECT professor.name,
       teacher.course_name,
       (professor.salary * 12) AS Annual_salary
FROM professor
INNER JOIN teacher
ON professor.id = teacher.prof_id;

SELECT professor.name, 
       teacher.course_name,
       professor.salary
FROM professor
INNER JOIN teacher
ON professor.id = teacher.prof_id
ORDER BY professor.salary DESC,
 professor.name ASC,
;