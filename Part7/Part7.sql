-- What is Identity?
-- Creating an Identity column
-- Supply explicit values for identity columns using IDENTITY_INSERT
-- Reset identity value using DBCC CHECKIDENT command

CREATE DATABASE Part7Sample;

USE Part7Sample;
GO

CREATE TABLE tblPerson
(
ID INT PRIMARY KEY,
Name NVARCHAR(50),
Email NVARCHAR(50),
GenderID INT,
Age INT
);

CREATE TABLE tblGender
(
ID INT PRIMARY KEY,
Gender NVARCHAR(50) 
);

INSERT INTO tblGender VALUES
(1, 'Male'),
(2, 'Female'),
(3, 'Unknown'); 



INSERT INTO tblPerson VALUES 
(1, 'John', 'j@j.com', NULL, NULL),
(2, 'Ron', 'mr.com', 1, NULL),
(3, 'Rich', 'r@r.com', NULL, NULL),
(4, 'Sara', 's@r.com', 2, 10),
(5, 'Sara', 's@s.com', 2,NULL),
(6, 'Jane', 'a@a.com', 2, NULL);

UPDATE tblPerson
SET 
Name = 'Jane',
Email = 'a@a.com',
GenderID = '1',
Age = 20
WHERE ID = 6;


INSERT INTO tblPerson VALUES 
(7, 'Todd', 't@t.com', 1, 25);

SELECT * FROM tblGender 
SELECT * FROM tblPerson 

SELECT * FROM tblPerson1; 

INSERT INTO tblPerson1 VALUES ( 'Martin');

DELETE FROM tblPerson1 WHERE PersonId = 1;

SET IDENTITY_INSERT tblPerson1 OFF 

INSERT INTO tblPerson1 (PersonId, Name) VALUES (1, 'Jane');

An explicit value for the identity column in table tblPerson1
can only be specified when a column list is used and IDENTITY_INSERT is ON.

/*
If a column is marked as an identity column, then the values for this column are automatically generated, when you insert a new into the table.

CREATE TABLE tblPerson
(
PersonId INT IDENTITY(1,1) PRIMARY KEY,
Name NVARCHAR(20)
)

Note: Seed and Increment values are optional. If you don't specify the Identity and seed they both default to 1.
To explicit supply a value for identity column
1. First turn on identity insert-SET Identity_Insert tblPerson ON
2. In the insert query specify the column list
    Insert into tblPerson(PersonId, Name) VALUES (2, 'John')

    If you have deleted all the rows in a table, and you want to reset the identity column value, use DBCC CHECKIDENT command.

    DBCC CHECKIDENT('tblPerson', RESEED, 0)


*/


DELETE FROM tblPerson1; 

DBCC CHECKIDENT(tblPerson1, reseed, 0);

SELECT * FROM tblPerson1; 