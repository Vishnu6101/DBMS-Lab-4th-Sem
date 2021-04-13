-- 1. Count the total number of Orders Placed.

SELECT COUNT(*) AS No_Of_Orders FROM Orders;

-- 2. Count the number of salesmen whose commission is greater than 5%.

SELECT COUNT(*) FROM Salesmen WHERE Comm > 5;

-- 3. Find average order amount of each salesman.

SELECT Sid, AVG(O_amt) FROM Orders
GROUP BY Sid;

-- 4. Find out the orders whose order amount is more than a given amount and also find the new order amount as original order amount * 5.

SET @OrderAmount = 200;
SELECT *, @OrderAmount * 5 AS NewOrderAmount FROM Orders WHERE O_amt > @OrderAmount;

-- 5. Determine the minimum and maximum salary of the salesman and rename the title as “min_sal” and “max_sal” respectively. 

SELECT MIN(salary) AS Min_Sal FROM Salesmen;
SELECT MAX(salary) AS Max_Sal FROM Salesmen;

-- 6.	Show the use of right and left justify string function. 

SELECT LEFT(Pincode, 3) AS District,
RIGHT(Pincode, 3) AS PostOffice
FROM Customers;

-- 7.	Show use of floor and ceiling function. 

SELECT Sid, AVG(O_amt), CEIL(AVG(O_amt)), FLOOR(AVG(O_amt))
FROM Orders
GROUP BY Sid;

-- 8.	Display customer name which customer no is highest. 

SELECT Cname FROM Customers
ORDER BY Cid DESC
LIMIT 1;

-- 9.	Display customer name oh the salesman staying in Ahmedabad. 

SELECT Customers.* FROM Customers WHERE Customers.Cid IN
	(SELECT Orders.Cid FROM Orders WHERE Orders.Sid IN
		(SELECT Sid FROM Salesmen WHERE City = "Ahmedabad"));
		
SELECT Customers.* FROM Customers WHERE Customers.Cid IN
	(SELECT Orders.Cid FROM Orders WHERE Orders.Sid IN
		(SELECT Sid FROM Salesmen WHERE City = "Madurai"));

-- 10.	Display order info for which order was taken earliest. 

SELECT * FROM Orders
ORDER BY Odate
LIMIT 1;


--EXTRA QUERIES

-- 11. Count the number of customers in each Class.

SELECT Class, COUNT(Cid) FROM Customers
GROUP BY Class;

-- 12. Display the monthly wise sales history.

SELECT CONCAT(MONTHNAME(Odate), YEAR(Odate)) AS "Sales(Monthwise)",
SUM(O_amt) AS Total, AVG(O_amt) AS Average
FROM Orders
GROUP BY MONTHNAME(Odate)
ORDER BY MONTHNAME(Odate);


-- 13. Display the Salesmen with their number and name in “last 3 numbers – name” Format.

SELECT CONCAT(RIGHT(Sid, 3)," - ",Sname) AS "Salesmen" FROM Salesmen;

-- 14. Select the Salesmen With maximum Commission.

SELECT * FROM Salesmen WHERE Comm IN (SELECT MAX(Comm) FROM Salesmen);

-- 15. Select the Salesmen with Minimum Salary.

SELECT * FROM Salesmen WHERE Salary IN (SELECT MIN(Salary) FROM Salesmen);