-- TRANSACTION CONTROL LANGUAGE (TCL).

-- COMMIT, ROLLBACK, SAVEPOINT

USE Formula_1;

START TRANSACTION;  -- Active State.
INSERT INTO CONSTRUCTORS VALUES (11,'PORSCHE',0,0);
UPDATE CONSTRUCTORS SET CPodiums = 10, CWins = 4 WHERE CNo = 11;
SELECT * FROM CONSTRUCTORS;  -- Partially Commited State.

ROLLBACK;  -- Falied State.
SELECT * FROM CONSTRUCTORS;

START TRANSACTION;  -- Active State.
INSERT INTO CONSTRUCTORS VALUES (11,'PORSCHE',0,0);
UPDATE CONSTRUCTORS SET CPodiums = 10, CWins = 4 WHERE CNo = 11;
SELECT * FROM CONSTRUCTORS;  -- Partially Commited State.

COMMIT;  -- Commited State.
SELECT * FROM CONSTRUCTORS;


START TRANSACTION;  -- Active State.
UPDATE CONSTRUCTORS SET CPodiums = 15, CWins = 7 WHERE CNo = 11;
SELECT * FROM CONSTRUCTORS;

SAVEPOINT UPDATE_SUCCESS;

DELETE FROM CONSTRUCTORS WHERE CNo = 11;
SELECT * FROM CONSTRUCTORS;  -- Partially Commited State.

ROLLBACK TO UPDATE_SUCCESS;  -- Aborted State.
SELECT * FROM CONSTRUCTORS;


START TRANSACTION;  -- Active State.
DELETE FROM CONSTRUCTORS WHERE CNo = 11;
COMMIT;  -- Commited State.
SELECT * FROM CONSTRUCTORS;