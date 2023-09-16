/*
Name: Bassit Ilahi
Panther-ID: x x x - 8318
Course: COP 4710
Assignment#: 4
Due: Wed, March 29, 2023
I hereby certify that this work is my own and none of it is the work of any other person.
Signature: Bassit Ilahi
*/


-- checks if the tables already exists and if so remove them
DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS name;
DROP TABLE IF EXISTS citizen;
DROP TABLE IF EXISTS with_spouse;


-- create a new empty table called person
CREATE TABLE person(
PersonID int NOT NULL,
Dplace VARCHAR(25),
Dyear int,
Webpage VARCHAR(255),
Education VARCHAR(255),
Phone int,
Address VARCHAR(255),
EmailID VARCHAR(255),
Sex char check (sex IN ('F','M')),
MsgFile VARCHAR(255),
BCity VARCHAR(255),
BCountry VARCHAR(255),
BDate VARCHAR(255),
with_mother_PersonID int,
CONSTRAINT perspk
	PRIMARY KEY (PersonID),
CONSTRAINT persfk
	FOREIGN KEY (with_mother_PersonID) REFERENCES person(PersonID)
);
-- end person table creation 


-- create a new empty table called name
CREATE TABLE name(
LName VARCHAR(255) NOT NULL,
PersonID int NOT NULL, 
Mname VARCHAR (255),
Uname VARCHAR(255),
Remark VARCHAR(255),
CONSTRAINT namepk
	PRIMARY KEY (LName, PersonID),
CONSTRAINT namefk
	FOREIGN KEY (PersonID) REFERENCES person(PersonID)
);
-- end name table creation 


-- create a new empty table called citizen
CREATE TABLE citizen(
CCountry VARCHAR(255) NOT NULL,
PersonID int NOT NULL,
Commment VARCHAR(255),
CStatus VARCHAR(255),
CONSTRAINT citipk
	PRIMARY KEY (CCountry, PersonID),
CONSTRAINT citifk
	FOREIGN KEY (PersonID) REFERENCES person(PersonID)
);
-- end citizen table creation 


-- create a new empty table called with_spouse
CREATE TABLE with_Spouse(
PersonID int NOT NULL,
With_SpouseID int,
CONSTRAINT spousepk
	PRIMARY KEY (PersonID, With_SpouseID),
CONSTRAINT spousefk
	FOREIGN KEY (PersonID) REFERENCES person(PersonID),
	FOREIGN KEY (With_SpouseID) REFERENCES person(PersonID)
);
-- end with_Spouse table ceation 