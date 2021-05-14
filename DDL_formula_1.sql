CREATE DATABASE Formula_1;

USE Formula_1;

CREATE TABLE CONSTRUCTORS(
	CNo INTEGER NOT NULL PRIMARY KEY,
	CName VARCHAR(20) NOT NULL,
	CPodiums INTEGER DEFAULT NULL,
	CWins INTEGER DEFAULT NULL 
)ENGINE = InnoDB;

CREATE TABLE RACES(
	GPName VARCHAR(15) NOT NULL PRIMARY KEY,
	First_Place INTEGER DEFAULT NULL,
	Second_Place INTEGER DEFAULT NULL,
	Third_Place INTEGER DEFAULT NULL
)ENGINE = InnoDB;

CREATE TABLE TIMINGS(
	GPName VARCHAR(15) NOT NULL PRIMARY KEY,
	DNo INTEGER DEFAULT NULL,
	Fastest_Lap TIME DEFAULT NULL,
	CNo INTEGER DEFAULT NULL,
	Fastest_Pit_Stop TIME DEFAULT NULL,
	-- CONSTRAINT Best_Driver FOREIGN KEY (DNo) REFERENCES DRIVERS (DNo) ON DELETE CASCADE,
	CONSTRAINT Best_Constructor FOREIGN KEY (CNo) REFERENCES CONSTRUCTORS (CNo) ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE = InnoDB;

CREATE TABLE DRIVERS(
	DNo INTEGER NOT NULL PRIMARY KEY,
	DName VARCHAR(20) NOT NULL,
	DPodiums INTEGER DEFAULT NULL,
	DWins INTEGER DEFAULT NULL,
	CNo INTEGER NOT NULL,
	GPName VARCHAR(15) NOT NULL,
	CONSTRAINT Team FOREIGN KEY (CNo) REFERENCES CONSTRUCTORS (CNo) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT Standings FOREIGN KEY (GPName) REFERENCES RACES (GPName) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT Track_Timings FOREIGN KEY (GPName) REFERENCES TIMINGS (GPName) ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE = InnoDB;

ALTER TABLE CONSTRUCTORS
ADD CONSTRAINT Chk_CWins CHECK (CWins <= CPodiums);

ALTER TABLE DRIVERS
ADD CONSTRAINT Chk_DWins CHECK (DWins <= DPodiums);