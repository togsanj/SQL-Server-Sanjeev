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

/*
# Part 4 – Default Constraint (Interview Questions)

## Basic Questions

1. What is a Default Constraint?
2. Why do we use a Default Constraint?
3. What is the purpose of a Default Constraint?
4. What is the syntax for creating a Default Constraint?
5. Can a table have multiple Default Constraints?
6. Can multiple columns have their own Default Constraints?
7. Which data types support Default Constraints?

## Practical Questions

8. How do you add a Default Constraint to an existing column?
9. How do you add a new column with a Default Constraint?
10. How do you drop a Default Constraint?
11. How do you remove a column that has a Default Constraint?
12. How do you find the name of a Default Constraint?

## Concept Questions

13. What happens if a value is not specified for a column that has a Default Constraint?
14. Does a Default Constraint work when an explicit value is provided?
15. Does a Default Constraint replace NULL values?
16. What happens if NULL is explicitly inserted into a nullable column with a Default Constraint?
17. Can a Default Constraint be used on a NOT NULL column?
18. Can a Default Constraint be used with a Foreign Key column?
19. Can we use expressions or functions (such as `GETDATE()`) as default values?

## Scenario-Based Questions

20. What happens if you insert a record without specifying the GenderID when the default value is 3?
21. What happens if the default value does not exist in the referenced parent table?
22. Why was the default value set to 3 for `GenderID` in this example?
23. In which situations should you use a Default Constraint?
24. Where are Default Constraints used in real-world applications?

## Interview-Based Questions

25. What is the difference between a Default Constraint and a NOT NULL Constraint?
26. What is the difference between a Default Constraint and allowing NULL values?
27. Can a column have both a Default Constraint and a Foreign Key Constraint?
28. Can a Default Constraint be changed after it is created?
29. What are the advantages of using Default Constraints?
30. Write the SQL syntax to create, drop, and use a Default Constraint.

# ⭐ Most Important Questions (Freshers)

1. What is a Default Constraint?
2. Why do we use a Default Constraint?
3. What happens if no value is provided for a column that has a Default Constraint?
4. What happens if NULL is explicitly inserted into a column with a Default Constraint?
5. Can a Default Constraint be used with a Foreign Key column?
6. How do you add a Default Constraint using `ALTER TABLE`?
7. How do you drop a Default Constraint?
8. Can a column have both a Default Constraint and a NOT NULL Constraint?
9. What is the difference between a Default Constraint and a NOT NULL Constraint?
10. Write the SQL syntax to create a Default Constraint.

*/