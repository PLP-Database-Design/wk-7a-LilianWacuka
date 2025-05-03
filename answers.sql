-- Question 1
-- an SQL query showing 1NF.
SELECT 
    OrderID,
    CustomerName,
    LTRIM(RTRIM(value)) AS Product -- Remove leading and trailing spaces from the product names
FROM 
    ProductDetail
CROSS APPLY  
    STRING_SPLIT(Products, ',');  
-- The query uses CROSS APPLY with STRING_SPLIT to convert the comma-separated product names into individual rows.
-- This ensures that each product name is in a separate row, thus satisfying the 1NF requirement of having atomic values.

-- Question 2
-- an SQL query showing 2NF.
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);
-- Insert into Orders table
INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

CREATE TABLE OrderDetails (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
-- Insert into OrderDetails table
INSERT INTO OrderDetails (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);