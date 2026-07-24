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


/*
# Part 9 – Unique Key Constraint (Interview Questions)

## Basic Questions

1. What is a Unique Key Constraint?
2. Why do we use a Unique Key Constraint?
3. What is the purpose of a Unique Key Constraint?
4. What is the syntax for creating a Unique Key Constraint?
5. Can a table have multiple Unique Key Constraints?
6. Can a Unique Key be created on multiple columns (Composite Unique Key)?
7. Which data types can have a Unique Key Constraint?

## Concept Questions

8. How does a Unique Key Constraint work?
9. Does a Unique Key allow duplicate values?
10. Does a Unique Key allow NULL values?
11. How many NULL values are allowed in a Unique Key column?
12. Can a Unique Key be created on an existing table?
13. Can a Unique Key be dropped after it is created?
14. Can a Unique Key be disabled?
15. What happens if you try to insert a duplicate value into a Unique Key column?

## Comparison Questions

16. What is the difference between a Primary Key and a Unique Key?
17. When should you use a Unique Key instead of a Primary Key?
18. Why can a table have only one Primary Key but multiple Unique Keys?
19. Which constraint is used to identify a row uniquely—Primary Key or Unique Key?
20. Which constraint allows NULL values—Primary Key or Unique Key?

## Practical Questions

21. How do you create a Unique Key using `ALTER TABLE`?
22. How do you drop a Unique Key Constraint?
23. How do you find the name of a Unique Key Constraint?
24. How do you create a Composite Unique Key?
25. Write the SQL syntax to create a Unique Key on the `Email` column.

## Foreign Key Constraint Questions

26. What is the purpose of `NOCHECK CONSTRAINT`?
27. What is the purpose of `CHECK CONSTRAINT`?
28. What is the difference between `CHECK CONSTRAINT` and `WITH CHECK CHECK CONSTRAINT`?
29. Why would you temporarily disable a Foreign Key Constraint?
30. What happens if invalid data is inserted while the Foreign Key Constraint is disabled?

## Scenario-Based Questions

31. Can a Foreign Key reference a Unique Key?
32. Can a column have both a Unique Key and a Foreign Key Constraint?
33. Where are Unique Keys used in real-world applications?
34. Give a real-world example where a Unique Key is better than a Primary Key.
35. What are the advantages and limitations of a Unique Key Constraint?

# ⭐ Most Important Questions (Freshers)

1. What is a Unique Key Constraint?
2. Why do we use a Unique Key Constraint?
3. What is the difference between a Primary Key and a Unique Key?
4. Can a table have multiple Unique Keys?
5. Does a Unique Key allow NULL values?
6. What happens if you insert a duplicate value into a Unique Key column?
7. How do you create a Unique Key using `ALTER TABLE`?
8. How do you drop a Unique Key Constraint?
9. Can a Foreign Key reference a Unique Key?
10. What is the difference between `NOCHECK CONSTRAINT` and `WITH CHECK CHECK CONSTRAINT`?
*/

