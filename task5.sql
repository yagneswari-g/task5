use example_DB;
-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Country VARCHAR(50)
);

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
-- Insert Customers
INSERT INTO Customers VALUES (1, 'Alice', 'USA');
INSERT INTO Customers VALUES (2, 'Bob', 'Canada');
INSERT INTO Customers VALUES (3, 'Charlie', 'UK');
INSERT INTO Customers VALUES (4, 'David', 'USA');

-- Insert Orders
INSERT INTO Orders VALUES (101, 1, '2024-06-01', 250.00);
INSERT INTO Orders VALUES (102, 2, '2024-06-02', 150.00);
INSERT INTO Orders VALUES (103, 1, '2024-06-03', 300.00);
INSERT INTO Orders VALUES (104, 5, '2024-06-04', 400.00);  -- Non-existent Customer
select * from Customers;
select * from Orders;
-- 1.Inner join
SELECT Customers.CustomerName, Orders.OrderID, Orders.Amount
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
-- 2.Left join
SELECT Customers.CustomerName, Orders.OrderID, Orders.Amount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
-- 3.Right join
SELECT Customers.CustomerName, Orders.OrderID, Orders.Amount
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
-- 4.Full outer join
SELECT Customers.CustomerName, Orders.OrderID, Orders.Amount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
UNION
SELECT Customers.CustomerName, Orders.OrderID, Orders.Amount
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
-- 5.Self Join to find customers in the same country
SELECT A.CustomerName AS Customer1, B.CustomerName AS Customer2, A.Country
FROM Customers A
JOIN Customers B ON A.Country = B.Country
WHERE A.CustomerID < B.CustomerID;
-- 6.Cartesian product: all combinations of Customers and Orders
SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID, Orders.Amount
FROM Customers
CROSS JOIN Orders;


