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

/*
# Part 3 – Foreign Key Constraint (Interview Questions)

## Basic Questions

1. What is a Foreign Key?
2. Why do we use a Foreign Key?
3. What is the purpose of a Foreign Key Constraint?
4. What is the syntax for creating a Foreign Key?
5. Can a table have multiple Foreign Keys?
6. Can a Foreign Key contain NULL values?
7. Can a Foreign Key contain duplicate values?
8. What is the difference between a Primary Key and a Foreign Key?
9. What is the relationship between Primary Key and Foreign Key?
10. Can a Foreign Key reference a UNIQUE key instead of a Primary Key?

## Practical Questions

11. How do you create a Foreign Key while creating a table?
12. How do you add a Foreign Key to an existing table using `ALTER TABLE`?
13. How do you drop a Foreign Key Constraint?
14. How do you rename a Foreign Key Constraint?
15. How do you view the Foreign Key Constraints of a table?

## Scenario-Based Questions

16. What happens if you insert a Foreign Key value that does not exist in the parent table?
17. What happens if you delete a parent record that is referenced by a child table?
18. What happens if you update the Primary Key value of a parent record?
19. Why should data be inserted into the parent table before the child table?
20. What is Referential Integrity?

## JOIN Related Questions

21. Why do we use a JOIN after creating a Foreign Key?
22. Which JOIN is used to display related data from parent and child tables?
23. Does a Foreign Key automatically join two tables?
24. Can two tables be joined without a Foreign Key? Explain.

## Interview-Based Questions

25. What are Parent and Child tables?
26. Can a table have more than one Foreign Key?
27. Can a Primary Key be a Foreign Key in another table?
28. What is the difference between a Foreign Key Constraint and Referential Integrity?
29. What are the advantages of using a Foreign Key?
30. Where are Foreign Keys used in real-world applications?

# ⭐ Most Important Questions (Freshers)

1. What is a Foreign Key?
2. Why do we use a Foreign Key?
3. What is the difference between a Primary Key and a Foreign Key?
4. What is Referential Integrity?
5. What happens if you insert a Foreign Key value that does not exist in the parent table?
6. What happens if you delete a parent record that is referenced by a child table?
7. How do you add a Foreign Key using `ALTER TABLE`?
8. Can a Foreign Key contain NULL values?
9. Can a Foreign Key contain duplicate values?
10. Write the SQL syntax to create a Foreign Key Constraint.

*/
