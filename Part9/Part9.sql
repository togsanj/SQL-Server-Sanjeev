-- Unique key constraint 

/*
In this session we will learn 
What is unique key constraint
When do you use unique key constraint over primary key constraint
Difference between unique key constraint and primary key constraint 

*/

/*
Retreiving Identity Column values 

We use UNIQUE constraint to enforce uniqueness of a column i.e the column shouldn't allow any duplicate value.
We can add a Unique constraint thru the designer or using a query.

To create the unique key using a query.
Alter table TableName 
Add Constraint ConstraintName Unique(ColumnName)

Both primary key and unique key are used to enforce, the uniqueness of a column. So, when do you choose one over the other?
A table can have, only one primary key. Id you want to enforce uniqueness on 2 or more columns, then we use unique key constraint.

What is the difference between Primary key constraint and Unique key constraint?
1.A table can have only one primary key, but more than one unique key
2. Primary key does not allow nulls, where as unique key allows one null

*/

CREATE DATABASE Part9Sample;

USE [Part9Sample]
GO


CREATE TABLE tblPerson
(
ID INT PRIMARY KEY,
Name NVARCHAR(50) NOT NULL,
Email NVARCHAR(50) NOT NULL,
GenderID INT,
Age INT 
);

CREATE TABLE tblGender
(
ID INT PRIMARY KEY,
Gender NVARCHAR(50) NOT NULL
);

ALTER TABLE tblPerson
ADD CONSTRAINT tblPerson_GenderID_FK
FOREIGN KEY (GenderID) REFERENCES tblGender(ID);


SELECT * FROM tblGender;
SELECT * FROM tblPerson;


ALTER TABLE tblPerson 
ADD CONSTRAINT UQ_tblPerson_Email UNIQUE(Email);

SET IDENTITY_INSERT tblPerson ON;

ALTER TABLE tblPerson 
NOCHECK CONSTRAINT tblPerson_GenderID_FK;

INSERT INTO tblPerson VALUES (2, 'XYZ', 'a@a.com', 1, 20);

ALTER TABLE tblPerson
DROP CONSTRAINT UQ_tblPerson_Email;

ALTER TABLE tblPerson
CHECK CONSTRAINT tblPerson_GenderID_FK;


ALTER TABLE tblPerson
WITH CHECK CHECK CONSTRAINT tblPerson_GenderID_FK; 