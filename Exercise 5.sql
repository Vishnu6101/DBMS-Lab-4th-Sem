-- 1.	Display customer no, name, city and order amount.

SELECT customers.Cid, customers.Cname, customers.City, Orders.O_amt
FROM Customers INNER JOIN Orders
ON Customers.Cid = Orders.Cid;

-- 2.	Display salesman details with their order details.

SELECT SM.Sid, SM.Sname, SM.City, O.Oid, O.Cid, O.product, O.Qty, O.Odate, O.O_amt
FROM Salesmen SM LEFT JOIN Orders O
ON SM.Sid = O.Sid;

-- 3.	Display customer info of a salesman.

SELECT * FROM CUSTOMERS WHERE Cid IN
(SELECT Cid FROM Orders WHERE Sid = "SM001");

-- 4.	Display all the salesmen living in the same city as customer.

SELECT DISTINCT SM.Sid, SM.Sname, Customers.Cname, SM.City
FROM (Orders LEFT JOIN Customers ON Customers.Cid = Orders.Cid)
LEFT JOIN Salesmen SM ON SM.Sid = Orders.Sid
WHERE SM.City = Customers.City
ORDER BY SM.Sid;

-- 5.	List the salesmen details along with customer names associated with them.

SELECT DISTINCT SM.*, C.Cname AS CustomerName
FROM (Orders LEFT JOIN Salesmen SM ON SM.Sid = Orders.Sid)
LEFT JOIN Customers C ON C.Cid = Orders.Cid;

-- 6.	List the salesmen details showing order amount greater than 1000.

SELECT SM.* FROM Salesmen SM
LEFT JOIN Orders ON SM.Sid = Orders.Sid
WHERE Orders.O_amt > 1000;

-- 7.	List the number of Class-‘A’ customers who placed orders with a particular salesman. 

SELECT DISTINCT Sid, COUNT(DISTINCT Orders.Cid) AS No_of_Customers, Customers.Class FROM Orders
LEFT JOIN Customers ON Customers.Cid = Orders.Cid
WHERE Customers.Class = "A" AND Sid = "SM002";

-- 8.	Display order information, along with salesman name,for those orders which have been placed on or before 10th of any month.

SELECT Orders.*, Salesmen.Sname
FROM Orders LEFT JOIN Salesmen ON Salesmen.Sid = Orders.Sid
WHERE DATE_FORMAT(Orders.Odate, "%d") IN(
    SELECT DATE_FORMAT(Orders.Odate, "%d")
    FROM ORDERS
    WHERE DATE_FORMAT(Orders.Odate, "%d") <= 10);

-- 9.	Display the commission amount of a salesman based on the orders placed.

SELECT Salesmen.Sid, Salesmen.Comm, COUNT(Orders.Product) AS Total_No_of_Orders,
    SUM(Orders.O_amt) AS Total_Order_amt,
    SUM(Orders.O_amt) * Salesmen.Comm / 100 AS Total_Commission_Amount
FROM Orders LEFT JOIN Salesmen ON Salesmen.Sid = Orders.Sid
GROUP BY Salesmen.Sid
ORDER BY Salesmen.Sid;

-- 10.	Find the city of the customer whose order amount is minimum

SELECT Cid, City FROM CUSTOMERS
WHERE Cid IN (SELECT Cid FROM ORDERS
WHERE O_amt IN (SELECT MIN(O_amt) FROM ORDERS));

-- 11.	Find the total number of products ordered and total order amount for each Customer.

SELECT C.Cid, C.Cname, C.Class, COUNT(O.Oid) AS No_of_Products, SUM(O.O_amt) AS Total_Order_Amt
FROM Customers C LEFT JOIN Orders O On C.Cid = O.Cid
GROUP BY C.Cid;
 
-- 12.	Display the recent 3 orders placed with their customer and salesmen details.

SELECT O.Odate, O.Oid, SM.Sid, SM.Sname, C.Cid, C.Cname, O.Product, O.O_amt
FROM (Orders O INNER JOIN Customers C ON C.Cid = O.Cid)
INNER JOIN Salesmen SM ON SM.Sid = O.Sid
ORDER BY O.Odate DESC
LIMIT 3;

-- 13.	Find the total number of products delivered by each salesmen and display their details.

SELECT SM.*, COUNT(O.Product) AS Total_Products_Delivered
FROM Orders O LEFT JOIN Salesmen SM ON SM.Sid = O.Sid
GROUP BY SM.Sid;