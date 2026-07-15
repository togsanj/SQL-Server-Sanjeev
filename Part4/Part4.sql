CREATE DATABASE Part4Sample;

USE Part4Sample
Go

CREATE TABLE tblPerson
(
ID INT PRIMARY KEY,
Name NVARCHAR(50) NOT NULL,
Email NVARCHAR(50) NOT NULL,
GenderID INT
);

CREATE TABLE tblGender
(
ID INT PRIMARY KEY,
Gender NVARCHAR(50) NOT NULL,
);

ALTER TABLE tblPerson 
ADD CONSTRAINT tblPerson_tblGender_FK 
FOREIGN KEY (GenderID) REFERENCES tblGender(ID)

SELECT Name, Email, Gender
FROM tblPerson
INNER JOIN tblGender
ON tblPerson.GenderID = tblGender.ID;



INSERT INTO tblPerson (ID, Name, Email, GenderID) VALUES 
(1, 'John', 'j@j.com', 1),
(2, 'Mary', 'm@m.com', 2),
(3, 'Simon', 's@s.com',  1),
(4, 'Sam', 'sam@sam.com', 1),
(5, 'May', 'may@may.com', 2),
(6, 'Kenny', 'k@k', 3);

INSERT INTO tblGender (ID, Gender) VALUES 
(1, 'Male'),
(2, 'Femal'),
(3, 'Unknow');

SELECT * FROM tblGender
SELECT * FROM tblPerson 

INSERT INTO tblPerson (ID, Name, Email) VALUES (7, 'Rich', 'r@r.com' )

--Now Learning how to Adding a default constraint

/*A Column default can be specified using Default constraint. 
The DEFAULT constraint is used to insert a default value into a column.
The default value will be added to all new records, 
if no other value is specified, including NULL.
*/

--Altering an existing column to add a default constraint

ALTER TABLE {TABLE_NAME}
ADD CONSTRAINT {CONSTRAINT_NAME}
DEFAULT {CONSTRAINT_VALUE} FOR {EXISITNG_COLUMN_NAME}

--Adding a new column, with default value, to an existing table
ALTER TABLE {TABLE_NAME}
ADD {COLUMN_NAME} {DATA_TYPE} [NULL | NOT NULL]
CONSTRAINT {CONSTRAINT_NAME} DEFAULT (DEFAULT_VALUE)

Dropping a constraint
ALTER TABLE {TABLE_NAME}
DROP CONSTRAINT {CONSTRAINT_NAME}

-------------------------
ALTER TABLE tblPerson 
ADD CONSTRAINT DF_tblPerson_GenderID
DEFAULT 3 FOR GenderID

INSERT INTO tblPerson (ID, Name, Email) VALUES (8, 'Mike', 'mike@r.com');

INSERT INTO tblPerson (ID, Name, Email, GenderID) VALUES (9, 'sara', 's@r.com', 3);

INSERT INTO tblPerson (ID, Name, Email, GenderID) VALUES (10, 'Johny', 'j@r.com', NULL);

SELECT * FROM tblGender
SELECT * FROM tblPerson

ALTER TABLE tblPerson 
ADD Age INT NOT NULL 
CONSTRAINT DF_tblPerson_Age DEFAULT (26);

ALTER TABLE tblPerson 
DROP CONSTRAINT DF_tblPerson_Age;

ALTER TABLE tblPerson
DROP COLUMN Age;