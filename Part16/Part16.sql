-- COALESCE() function in SQL Server

/*
In this session we will learn
COALESCE() function with an example

COALESCE() Function - Returns the first NON NULL value
*/

CREATE DATABASE Part16Sample;

USE Part16Sample;
GO

CREATE TABLE tblEmployee 
(
Id INT PRIMARY KEY,
FirstName NVARCHAR(50),
MiddleName NVARCHAR(50),
LastName NVARCHAR(50)
);

INSERT INTO tblEmployee (Id, FirstName, MiddleName, LastName) VALUES 
(1, 'Sam', NULL, NULL),
(2, NULL, 'Todd', 'Tanzan'),
(3, NULL, NULL, 'Sara'),
(4, 'Ben', 'Paker', NULL),
(5, 'James', 'Nick', 'Nancy');


SELECT * FROM tblEmployee;

SELECT 
Id, 
COALESCE(FirstName, MiddleName, LastName) AS Name
FROM tblEmployee;