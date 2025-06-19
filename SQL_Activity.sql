CREATE DATABASE OnlineStore;
GO

USE OnlineStore;


CREATE TABLE Client(
Id INT PRIMARY KEY,
Name VARCHAR(255) NOT NULL,
Street VARCHAR(255) NOT NULL,
City VARCHAR(255) NOT NULL,
Postal_code VARCHAR(255) NOT NULL,
Country VARCHAR(255) NOT NULL
);


CREATE TABLE Produts(
Product_id INT PRIMARY KEY,
Product_name VARCHAR(255) NOT NULL,
Product_category VARCHAR(255) NOT NULL,
Product_price DECIMAL(10,2) CHECK (Product_price > 0)
);

EXEC sp_rename 'Produts','Products';
 
CREATE TABLE Sales (
  Transaction_id INT IDENTITY(1,1) PRIMARY KEY, -- The first 1 = starting value, The second 1 = step size
  Customer_id INT FOREIGN KEY REFERENCES Client(Id),
  Product_id INT FOREIGN KEY REFERENCES Products(Product_id), --Changed the name of the table (check line 23)
  Quantity INT DEFAULT 1 CHECK (Quantity > 0),
  Transaction_date DATE DEFAULT GETDATE() -- GETDATE() returns the Date + Time, CURRENT_DATE returns Only the date.
);



