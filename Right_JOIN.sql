CREATE DATABASE right_join;

USE right_join;

CREATE TABLE Products(Product_ID INT PRIMARY KEY,
                      Product_Name VARCHAR(50),
                      Supplier_ID INT,
                      Price INT);
INSERT INTO Products(Product_ID , Product_Name, Supplier_ID, Price) VALUES
(1, "Laptop", 201, 60000),
(2, 'Mouse', 202, 800),
(3, "Keyboard", 202, 1500),
(4, 'Monitor', 203, 12000),
(5, "Webcam", NULL, 3000);

CREATE TABLE Suppliers(Supplier_ID INT PRIMARY KEY, Supplier_name VARCHAR(50), City VARCHAR(50));

INSERT INTO Suppliers(Supplier_ID, Supplier_Name, City) VALUES
(201, 'Dell', 'Chennai'),
(202, 'Logitech', 'Bangalore'),
(203, 'Samsung', 'Delhi'),
(204, 'HP', 'Mumbai'),
(205, 'Lenovo', 'Pune');

SELECT products.Product_Name,
       suppliers.Supplier_Name,
       suppliers.City
FROM products
RIGHT JOIN suppliers
ON products.Supplier_ID = suppliers.Supplier_ID;

SELECT Suppliers.Supplier_Name,
       Products.Product_Name
FROM Products
RIGHT JOIN Suppliers
ON Products.Supplier_ID = suppliers.Supplier_ID;