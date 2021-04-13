-- 1. Display all the details about each salesman with appropriate headings.

SELECT * FROM Salesmen;

-- 2. List all those salesmen who do not live in a given city.

SELECT * FROM Salesmen WHERE City <> "Madurai";

-- 3. Display all the class- 'A' customers with their id and name.

SELECT Cid,Cname FROM Customers WHERE Class = "A";

-- 4. Add new fields MONTHLY_SALES and MONTH in the salesmen table with appropriate data types.

ALTER TABLE Salesmen
ADD COLUMN Monthly_Sales NUMERIC(5,2) DEFAULT NULL,
ADD COLUMN Month VARCHAR(10) DEFAULT NULL;

-- 5. Change the name of the city of a given customer.

UPDATE Customers SET City = "Chennai" WHERE Cid = "C002";

-- 6. List the information of all the customers who are located in a given city.

SELECT * FROM Customers WHERE City = "Madurai";

-- 7. List the name of all the salesmen whose salary is greater than 2000.

SELECT Sname FROM Salesmen WHERE Salary > 2000;

-- 8. Change the order amount for a given order id.

UPDATE Orders SET O_amt = 100 WHERE Oid = "O009";

-- 9. Display order id and order date from orders table whose sales id is given 

SELECT Oid, Odate FROM Orders WHERE Sid = "SM001";

-- 10. Display the Order No., ODATE in the format "DD/MONTH/YYYY" from the ORDERS table.

SELECT Oid, DATE_FORMAT(Odate, "%d %M %Y") FROM Orders;


-- EXTRA QUERIES

-- 11. Display the Orders in ascending order of the Order Date.

SELECT * FROM Orders
ORDER BY Odate ASC;

-- 12. Display all the details of salesmen whose Monthly target amount is less than 1000.

SELECT * FROM salesmen WHERE Tgttoget < 1000;

-- 13. Display the orders details of orders with order amount greater than 500.

SELECT * FROM Orders WHERE O_amt >= 500;

-- 14. Display all the orders placed by the given customer ID.

SELECT * FROM Orders WHERE Cid = "C001";

-- 15. Display the salesmen table based on “% of Commission to achieve target” in decreasing order.

SELECT * FROM Salesmen
ORDER BY Comm DESC;