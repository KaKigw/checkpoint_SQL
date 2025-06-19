CREATE DATABASE OnlineStore;
GO

USE OnlineStore;
GO

CREATE TABLE Client(
Id INT IDENTITY(1,1) PRIMARY KEY,
Name VARCHAR(255) NOT NULL,
Street VARCHAR(255) NOT NULL,
City VARCHAR(255) NOT NULL,
Postal_code VARCHAR(255) NOT NULL,
Country VARCHAR(255) NOT NULL
);
GO

CREATE TABLE Produts(
Product_id INT IDENTITY(1,1) PRIMARY KEY,
Product_name VARCHAR(255) NOT NULL,
Product_category VARCHAR(255) NOT NULL,
Product_price DECIMAL(10,2) CHECK (Product_price > 0)
);
GO

EXEC sp_rename 'Produts','Products';
GO

CREATE TABLE Sales (
  Transaction_id INT IDENTITY(1,1) PRIMARY KEY, -- The first 1 = starting value, The second 1 = step size
  Customer_id INT FOREIGN KEY REFERENCES Client(Id),
  Product_id INT FOREIGN KEY REFERENCES Products(Product_id), --Changed the name of the table (check line 23)
  Quantity INT DEFAULT 1 CHECK (Quantity > 0),
  Transaction_date DATE DEFAULT GETDATE() -- GETDATE() returns the Date + Time, CURRENT_DATE returns Only the date.
);
GO

--Changing the constraint to NULL because it was NOT NULL
ALTER TABLE Products
ALTER COLUMN Product_name VARCHAR(255)  NULL;
GO


ALTER TABLE Products
ALTER COLUMN Product_category VARCHAR(255)  NULL;
GO


--TESTS
SELECT * FROM Products
WHERE Product_name IS NOT NULL OR Product_category IS NOT NULL;
GO

--Changing the constraint to NOT NULL because it was NULL
ALTER TABLE Products
ALTER COLUMN Product_name VARCHAR(255)  NOT NULL;
GO

ALTER TABLE Products
ALTER COLUMN Product_category VARCHAR(255)  NOT NULL;
GO

 --TESTS
SELECT * FROM Products
WHERE Product_name IS  NULL OR Product_category IS  NULL;
SELECT * FROM Products
WHERE Product_name IS  NOT NULL OR Product_category IS NOT NULL;
GO

INSERT INTO Client (Name, Street, City, Postal_code, Country)
VALUES 
('Smith', '123 Oak Ave', 'Springfield', '12345', 'USA'),
('Johnson', '45 Main St', 'Shelbyville', '67890', 'USA'),
('Williams', '789 Pine Rd', 'Capital City', '10112', 'Canada'),
('Brown', '10 Elm Blvd', 'Metropolis', '31415', 'USA'),
('Jones', '20 Maple Dr', 'Gotham', '92606', 'UK'),
('Garcia', '30 Birch Ln', 'Star City', '55555', 'USA'),
('Miller', '40 Cedar Ct', 'Central City', '77777', 'Germany'),
('Davis', '50 Willow Way', 'Oakhaven', '88888', 'Australia'),
('Rodriguez', '60 Poplar Pl', 'Riverdale', '99999', 'USA'),
('Martinez', '70 Spruce St', 'Sunnydale', '11223', 'France');
GO

INSERT INTO Products (Product_name, Product_category, Product_price)
VALUES 
('Laptop Pro', 'Electronics', 1200.00),
('Mechanical Keyboard', 'Electronics', 99.99),
('Noise-Cancelling Headphones', 'Electronics', 249.00),
('SQL for Beginners', 'Books', 35.50),
('Advanced Python', 'Books', 55.00),
('The Great Novel', 'Books', 18.75),
('Smart Speaker', 'Home Goods', 79.99),
('Robot Vacuum', 'Home Goods', 300.00),
('Air Fryer 5L', 'Home Goods', 85.00),
('Wireless Mouse', 'Electronics', 25.00);
GO

INSERT INTO Sales (Customer_id, Product_id, Quantity, Transaction_date)
VALUES
(1, 1, 1, '2023-01-05'),
(4, 2, 2, '2023-01-05'),
(7, 1, 1, '2023-01-06'),
(2, 3, 3, '2023-01-07'),
(5, 1, 1, '2023-01-08'),
(8, 1, 1, '2023-01-08'),
(3, 2, 2, '2023-01-09'),
(6, 1, 1, '2023-01-10'),
(9, 5, 5, '2023-01-11'),
(10, 1, 1, '2023-01-12'),
(2, 1, 1, '2023-01-12'),
(3, 4, 4, '2023-01-13');
GO


CREATE VIEW Transactions_Qty_1 AS
SELECT * FROM Sales
WHERE Quantity=1;
GO 

SELECT * FROM Transactions_Qty_1;
GO

UPDATE Sales 
SET Quantity =10
WHERE Quantity=1;
GO
CREATE VIEW Transactions_Qty_10 AS
SELECT * FROM Sales
WHERE Quantity=10;
GO 
SELECT * FROM Transactions_Qty_10;
GO

SELECT * FROM Sales;
GO

DELETE FROM Sales 
WHERE Transaction_id=2;
GO

SELECT * FROM Sales;
GO

TRUNCATE TABLE Sales;

SELECT * FROM Sales;
GO