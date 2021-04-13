-- 1. Add primary key to the table CUSTOMERS for CID and Foreign Key for the same field 	to the table ORDERS alter table command.

ALTER TABLE Customers
ADD PRIMARY KEY (Cid);

ALTER TABLE Orders
ADD FOREIGN KEY (Cid) REFERENCES Customers(Cid);

-- 2.Create a new table PRODUCT which contains PRODID (primary key), PRODNAME, UNITPRICE and AVAILABILITY 
-- where data values inserted for PRODID must start with the capital letter P and PRODNAME should be in the upper case. 
-- Insert correct values into the table and display an error message for incorrect values.

CREATE TABLE Product(
    PRODID VARCHAR(5) NOT NULL PRIMARY KEY,
    PRODNAME VARCHAR(20) NOT NULL CHECK
        (
            BINARY PRODNAME = UPPER(PRODNAME)
        ),
        UNITPRICE NUMERIC(5, 2) NOT NULL,
        AVAILABILITY VARCHAR(5) NOT NULL
)

-- 3. List all the information of customers whose state contains null value.

SELECT * FROM Customers WHERE State = NULL;

-- 4. Disable all foreign keys in ORDERS table and enable again.

ALTER TABLE Orders DISABLE KEYS;

SELECT TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, COMMENT
FROM INFORMATION_SCHEMA.STATISTICS
WHERE TABLE_SCHEMA = "sales_management" AND TABLE_NAME = "Orders";

ALTER TABLE Orders ENABLE KEYS;

SELECT TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, COMMENT
FROM INFORMATION_SCHEMA.STATISTICS
WHERE TABLE_SCHEMA = "sales_management" AND TABLE_NAME = "Orders";

-- 5. List all the information of customers in descending order according to their name.

SELECT * FROM Customers
ORDER BY CName DESC;


-- 6. Make the salesmen id in the format "SM___"

ALTER TABLE Salesmen
ADD CONSTRAINT primarykey_chk CHECK (Sid LIKE "SM%");

-- 7. Display all the data constraints in the database.

SELECT TABLE_SCHEMA, TABLE_NAME, CONSTRAINT_TYPE, CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = 'sales_management';