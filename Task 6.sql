USE Schema1;
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    City VARCHAR(50)
);

CREATE TABLE Orderss (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Product VARCHAR(100),
    Amount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

INSERT INTO Customer VALUES (1, 'Rohitha', 'Hyderabad');
INSERT INTO Customer VALUES (2, 'Anil', 'Bangalore');
INSERT INTO Customer VALUES (3, 'Sneha', 'Delhi');
INSERT INTO Customer VALUES (4, 'Vikram', 'Chennai');
INSERT INTO Customer VALUES (5, 'Lakshmi', 'Mumbai');



INSERT INTO Orderss VALUES (101, 1, 'Laptop', 60000.00);
INSERT INTO Orderss VALUES (102, 1, 'Mouse', 500.00);
INSERT INTO Orderss VALUES (103, 2, 'Keyboard', 1200.00);
INSERT INTO Orderss VALUES (104, 4, 'Monitor', 8000.00);
INSERT INTO Orderss VALUES (105, 3, 'Tablet', 15000.00);      
INSERT INTO Orderss VALUES (106, 4, 'Printer', 7000.00);     
INSERT INTO Orderss VALUES (107, 5, 'Chair', 2000.00); 

SELECT C.Name, O.Product, O.Amount
FROM Customer C
INNER JOIN Orderss O ON C.CustomerID = O.CustomerID;

SELECT C.Name, O.Product, O.Amount
FROM Customer C
LEFT JOIN Orderss O ON C.CustomerID = O.CustomerID;

SELECT C.Name, O.Product, O.Amount
FROM Customer C
RIGHT JOIN Orderss O ON C.CustomerID = O.CustomerID;

SELECT C.Name, O.Product, O.Amount
FROM Customer C
LEFT JOIN Orderss O ON C.CustomerID = O.CustomerID

UNION

SELECT C.Name, O.Product, O.Amount
FROM Customer C
RIGHT JOIN Orderss O ON C.CustomerID = O.CustomerID;

USE Schema1;
SELECT 
    Name,
    (SELECT SUM(Amount) 
     FROM Orderss O
     WHERE C.CustomerID = O.CustomerID) AS TotalSpent
FROM Customer C;

SELECT * 
FROM Customer
WHERE CustomerID IN (SELECT CustomerID FROM Orderss);

SELECT * 
FROM Customer C
WHERE EXISTS (
    SELECT 1 
    FROM Orderss O 
    WHERE C.CustomerID = O.CustomerID
);

SELECT * 
FROM Orderss O1
WHERE Amount > (
    SELECT AVG(Amount) 
    FROM Orderss O2 
    WHERE O1.CustomerID = O2.CustomerID
);

SELECT Name, AvgOrder
FROM Customer C
JOIN (
    SELECT CustomerID, AVG(Amount) AS AvgOrder
    FROM Orderss
    GROUP BY CustomerID
) AS Sub
ON C.CustomerID = Sub.CustomerID;

SELECT Name
FROM Customer
WHERE CustomerID = (
    SELECT CustomerID
    FROM Orderss
    GROUP BY CustomerID
    ORDER BY SUM(Amount) DESC
    LIMIT 1
);
