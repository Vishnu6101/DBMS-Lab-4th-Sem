-- DATA CONTROL LANGUAGE (DCL)

-- GRANT --> giving permissions to the users.

-- REVOKE --> removing permissions from the users.

CREATE USER 'Vishnu'@'localhost' IDENTIFIED BY 'qwerty';

GRANT SELECT ON Formula_1.* TO 'Vishnu'@'localhost';

SYSTEM MYSQL -u Vishnu -p -t < DCL_formula_1_2nd_user.sql

GRANT INSERT ON Formula_1.* TO 'Vishnu'@'localhost';

SYSTEM MYSQL -u Vishnu -p -t < DCL_formula_1_2nd_user.sql

GRANT UPDATE ON Formula_1.* TO 'Vishnu'@'localhost';

SYSTEM MYSQL -u Vishnu -p -t < DCL_formula_1_2nd_user.sql

GRANT DELETE ON Formula_1.* TO 'Vishnu'@'localhost';

SYSTEM MYSQL -u Vishnu -p -t < DCL_formula_1_2nd_user.sql

REVOKE ALL PRIVILEGES  ON Formula_1.* FROM 'Vishnu'@'localhost';

SYSTEM MYSQL -u Vishnu -p -t < DCL_formula_1_2nd_user.sql

DROP USER 'Vishnu'@'localhost';
