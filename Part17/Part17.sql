-- UNION and UNION ALL

/*
In this session we will learn
Purpose of UNION and UNION ALL
Difference between UNION and UNION ALL
Difference between JOIN and UNION


UNION and UNION ALL operators in SQL Server, are used to combine the result-set of two or more SELECT queries.


*/

CREATE DATABASE Part17Sample;

USE [Part17Sample];
GO

EXEC sp_rename 'tblInidaCustomers', 'tblIndiaCustomers';

CREATE TABLE tblIndiaCustomers
(Id INT PRIMARY KEY,
Name NVARCHAR(50) NOT NULL,
Email NVARCHAR(50) NOT NULL
)

CREATE TABLE tblUKCustomers
(
Id INT PRIMARY KEY,
Name NVARCHAR(50) NOT NULL,
Email NVARCHAR(50) NOT NULL
);

INSERT INTO tblIndiaCustomers (Id, Name, Email) VALUES 
(1, 'Rai', 'R@R.com'),
(2, 'Sam', 'S@S.com')

INSERT INTO tblUKCustomers (Id, Name, Email) VALUES 
(1, 'Ben', 'B@B.com'),
(2, 'Sam', 'S@S.com')

CREATE TABLE tblUSCustomers
(
ID INT PRIMARY KEY,
Name NVARCHAR(50) NOT NULL,
Email NVARCHAR(50) NOT NULL
);

INSERT INTO tblUSCustomers (Id, Name, Email) VALUES 
(1, 'John', 'J@J.com'),
(2, 'Todd', 'T@T.com')


SELECT * FROM tblIndiaCustomers
 UNION ALL
SELECT * FROM tblUKCustomers
UNION ALL
SELECT * FROM tblUSCustomers
ORDER BY Name


-- UNION
SELECT Id, Name, Email FROM tblIndiaCustomers
UNION
SELECT Id, Name, Email FROM tblUKCustomers


-- UNION ALL
SELECT Id, Name, Email FROM tblIndiaCistomers
UNION ALL
SELECT Id, Name, Email FROM tblUKCustomers

/*
Note: For UNION and UNION ALL to work, the Number, Data types, and the border of the columns in the select statements should be same.

UNION & UNION ALL & JOINS

Different between UNION and UNION ALL
1. UNION removes duplicate rows, where as UNION ALL does not.
2. UNION has to perform distinct sort to remove duplicates, which makes it less faster than UNION ALL

Note: Estimated query execution plan - CTRL + L

Sorting results of a UNION or UNION ALL
ORDER BY clause should be used only on the last SELECT statement in the UNION query

Difference between UNION and JOIN
UNION combines the result-set of two or more select queries into a single result-set which includes all the rows from all the queries in the union, where as JOINS, retrieve data from two or more tables based on logical relationship between the tables.

In short, UNION combines rows from 2 or more tables, where JOINS combine columns from 2 or more table.
*/
