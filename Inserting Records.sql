INSERT INTO Salesmen (`Sid`,`Sname`,`City`,`Salary`,`Tgttoget`,`Comm`)
VALUES ('SM001','Shankar','Chennai',2500,1000,9),
('SM002','Shiva','Madurai',2000,800,8.5),
('SM003','Rahul','Trichy',3500,1500,10),
('SM004','Krish','Madurai',2000,900,7.5),
('SM005','Ganesh','Kanyakumari',3000,1000,8.4),
('SM006','Harish','Ahmedabad',2700,1200,7);

INSERT INTO Customers (`Cid`,`Cname`,`City`,`State`,`Pincode`,`Class`)
VALUES ('C001','Vishnu','Madurai','Tamil Nadu',625002,'A'),
('C002','Ashok','Trichy','Tamil Nadu',620005,'A'),
('C003','Vicky','Chennai','Tamil Nadu',600005,'B'),
('C004','Yamini','Madurai','Tamil Nadu',625020,'A'),
('C005','Rekha','Kanyakumari','Tamil Nadu',627127,'C'),
('C006','Mahesh','Ahmedabad','Gujarat',380008,'B');

INSERT INTO Orders (`Oid`,`Cid`,`Sid`,`Product`,`Qty`,`Odate`,`O_amt`)
VALUES ('O001','C002','SM003','Shampoo','2','2021-03-11',80.00),
('O002','C001','SM002','Dress','1','2021-03-10',400.00),
('O003','C005','SM005','Grocery items','6','2021-02-01',140.00),
('O004','C003','SM001','Laptop Accessories','4','2021-03-12',900.00),
('O005','C002','SM003','Spices','3','2021-03-03',450.00),
('O006','C004','SM004','Oil','1','2021-03-01',100.00),
('O007','C002','SM003','Dress','2','2021-02-11',500.00),
('O008','C001','SM002','Bed Sheets','3','2021-02-28',300.00),
('O009','C003','SM001','Snacks','7','2021-02-18',50.00),
('O0010','C004','SM004','Stationery','1','2021-03-14',80.00),
('O0011','C006','SM006','Calculator','1','2021-03-20',400.00);