@echo off
@echo Recovery Operations using Batch File.

d:

CD "D:\wamp64\bin\mysql\mysql8.0.21\bin"

@echo Dumping Formula 1 Database in FORMULA_1.sql File.

mysqldump -u root -p Formula_1 > FORMULA_1.sql

@echo Deleting the Database and Creating a Empty Database.

mysql -u root -p -t < "E:\Online Class Materials\4th Semester\DBMS\Lab Programs\Recovery_Operations.sql"

PAUSE

CD "D:\wamp64\bin\mysql\mysql8.0.21\bin"

@echo Recovering the Database from FORMULA_1.sql file

mysql -u root -p -t Formula_1 < FORMULA_1.sql

PAUSE

EXIT