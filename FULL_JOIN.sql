CREATE DATABASE Full_Join;

USE Full_Join;

CREATE TABLE Book (BOOK_ID INT PRIMARY KEY,
                   BOOK_NAME VARCHAR(50),
                   AUTHOR_ID INT,
                   ISSUED_ON DATE,
                   DUE_DATE DATE);
                   
INSERT INTO Book(BOOK_ID, AUTHOR_ID, BOOK_NAME, ISSUED_ON, DUE_DATE) VALUES
(1, 1,'RD SHARMA', '2023-01-01', '2023-01-08'),
(2, 2,'GATE CRACKER', '2023-02-02', '2023-02-09'),
(3, 3,'MORRIS MANO', '2023-03-03', '2023-03-10'),
(4, 4,'NK PUBLICATIONS', '2023-04-04', '2023-04-11'),
(5, 5,'BIG BANG THEORY', '2023-05-05', '2023-05-12');

CREATE TABLE Author(AUTHOR_ID INT PRIMARY KEY, AUTHOR_NAME VARCHAR(50));
INSERT INTO Author(AUTHOR_ID, AUTHOR_NAME) VALUES
(1,'John Smith'),
(2,'Emily Brown'),
(3, NULL),
(4, 'Sophia Williams'),
(5, 'Daniel Anderson'),
(6, 'Robert Johnson');

SELECT book.book_name, author.author_name
FROM book
LEFT JOIN author
ON book.author_id = author.author_id
WHERE book.book_name IS NOT NULL
UNION
SELECT book.book_name, author.author_name
FROM book
RIGHT JOIN author
ON book.author_id = author.author_id
WHERE author.author_name IS NOT NULL ;

describe book;
SELECT b.BOOK_NAME,
       a.AUTHOR_NAME
FROM Book b
LEFT JOIN Author a
    ON b.AUTHOR_ID = a.AUTHOR_ID
UNION
SELECT b.BOOK_NAME,
       a.AUTHOR_NAME
FROM Book b
RIGHT JOIN Author a
    ON b.AUTHOR_ID = a.AUTHOR_ID;

describe book;
SELECT b.BOOK_ID,
       b.BOOK_NAME,
       a.AUTHOR_ID,
       a.AUTHOR_NAME
FROM Book b
LEFT JOIN Author a
    ON b.AUTHOR_ID = a.AUTHOR_ID
UNION
SELECT b.BOOK_ID,
       b.BOOK_NAME,
       a.AUTHOR_ID,
       a.AUTHOR_NAME
FROM Book b
RIGHT JOIN Author a
    ON b.AUTHOR_ID = a.AUTHOR_ID;
    
SELECT author.author_name,
       book.book_name
FROM book
LEFT JOIN author
ON book.author_id = author.author_id
UNION 
SELECT author.author_name,
       book.book_name
FROM book
RIGHT JOIN author
ON book.author_id = author.author_id;

SELECT a.AUTHOR_NAME
FROM Author a
LEFT JOIN Book b
    ON a.AUTHOR_ID = b.AUTHOR_ID
WHERE b.BOOK_ID IS NULL;