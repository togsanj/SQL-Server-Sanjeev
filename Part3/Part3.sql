CREATE DATABASE Part3Sample; 

use [Part3Sample]
Go

CREATE TABLE tblPerson 
(
ID INT PRIMARY KEY,
Name NVARCHAR(50) NOT NULL,
Email NVARCHAR(50) NOT NULL,
GenderID INT
);

ALTER TABLE tblPerson
ALTER Column Name NVARCHAR(50) NOT NULL

ALTER TABLE tblPerson
ALTER COLUMN Email NVARCHAR(50) NOT NULL

CREATE TABLE tblGender
(
ID INT PRIMARY KEY,
Gender NVARCHAR(50) NOT NULL,
);

ALTER TABLE tblPerson 
ADD CONSTRAINT tblPerson_GenderID_FK 
FOREIGN KEY (GenderID) REFERENCES tblGender(ID);

INSERT INTO tblPerson (ID, Name, Email, GenderID) 
VALUES 
(1, 'John', 'j@j.com', 1),
(2, 'Mary', 'm@m.com', 2),
(3, 'Luke', 'l@l.com', 3);


INSERT INTO tblGender (ID, Gender) 
VALUES 
(1, 'Male'),
(2, 'Female')



SELECT Name, Email, Gender
from tblPerson
JOIN tblGender
ON tblPerson.GenderID = tblGender.ID;

