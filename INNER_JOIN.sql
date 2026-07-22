-- CREATE DATABASE Student_Detail;
USE Student_Detail;

-- CREATE TABLE Student(
-- Roll_no INT PRIMARY KEY,
-- Name VARCHAR(25),
-- Address VARCHAR(50),
-- Age INT
-- );

-- INSERT INTO Student (Roll_no, Name, Address, Age) VALUES
-- (1, "Liam", "London", 19),
-- (2, "Safia", "Berlin", 20),
-- (3, "Mateo", "Modrid", 21),
-- (4, "Emma", "Paris", 22),
-- (5, "Noah", "Rome", 23);

-- CREATE TABLE StudentCourse(
-- Course_ID INT PRIMARY KEY,
-- ROLL_NO INT);

-- INSERT INTO StudentCourse(course_ID, ROLL_NO) VALUES
-- (1, 1),
-- (2, 2),
-- (3, 3),
-- (6, 7);

SELECT StudentCourse.COURSE_ID, Student.NAME, Student.AGE FROM Student INNER JOIN StudentCourse ON Student.ROLL_NO = StudentCourse.ROLL_NO;