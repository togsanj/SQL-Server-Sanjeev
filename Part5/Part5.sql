-- Cascading referential integrity constraint 


/* 
Cascading referential integrity constraint allows to define the actions Microsoft SQL Server should take 
when a user attempts to delete or update a key to which an existing foreign keys points.


For example, If you delete row with ID = 1 from tblGender table, 
then row with ID = 3 from tblPerson table becomes an orphan record. 
You will not be able to tell the Gender for this row. 
SO, Cascading referential integrity constraint can be used to define actions Microsoft SQL Server should take when this happens. 
By default, we get an error and the DELETE or UPDATE statement is rolled back.

*/

CREATE DATABASE Part5Sample;

USE [Part5Sample]
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
Gender NVARCHAR(50) 
);

ALTER TABLE tblGender
ALTER COLUMN Gender NVARCHAR(50) NOT NULL 

ALTER TABLE tblPerson
ADD CONSTRAINT tblPerson_GenderID_FK
FOREIGN KEY (GenderID)  REFERENCES tblGender(ID);

INSERT INTO tblPerson (ID, Name, Email, GenderID) VALUES 
(1, 'John', 'j@j.com', 1),
(2, 'Simon', 's@s.com', 2),
(3, 'Rich', 'r@r.com', 1),
(4, 'sara', 's@r.com', 3),
(5, 'Johny', 'j@r.com', 3);

INSERT INTO tblPerson (ID, Name, Email, GenderID) VALUES 
(6, 'Kristy', 'k@k.com', NULL);



INSERT INTO tblGender 
(ID, Gender) VALUES 
(1, 'Male'),
(2, 'Female'),
(3, 'Unknown');


ALTER TABLE tblPerson 
ADD CONSTRAINT DF_tblPerson_tblGender
DEFAULT 3 FOR GenderID;


SELECT * FROM tblGender
SELECT * FROM tblPerson

UPDATE tblPerson 
SET GenderID = 2
WHERE ID = 1;

UPDATE  tblPerson
SET Name = 'Mary',
Email = 'm@m.com',
GenderID = 3
WHERE ID =2;

Update tblPerson
SET Name = 'Simon',
Email = 's@s.com',
GenderID = 2
WHERE ID = 2;

UPDATE tblPerson
SET 
Name = CASE
        WHEN ID =1 THEN 'John'
        WHEN ID =2 THEN 'Simon'
        WHEN ID = 3 THEN 'Rich'
        WHEN ID = 4 THEN 'Sara'
        WHEN ID = 5 THEN 'Johny'
        WHEN ID = 6 THEN 'Kristy'
        ELSE Name
     END,
Email = CASE 
       WHEN ID =1 THEN 'j@j.com'
       WHEN ID = 2 THEN 's@s.com'
       WHEN ID = 3 THEN 'r@r.com'
       WHEN ID = 4 THEN 's@r.com'
       WHEN ID = 5 THEN 'j@r.com'
       ELSE Email 
     END,
GenderID = CASE 
          WHEN ID = 1 THEN 1
          WHEN ID = 2 THEN 2
          WHEN ID = 3 THEN 1
          WHEN ID = 4 THEN 3
          WHEN ID = 5 THEN 3
          WHEN ID = 6 THEN NULL
        ELSE GenderID
      END
WHERE ID IN (1, 2, 3, 4, 5, 6);


DELETE FROM tblGender where ID =2;


INSERT INTO tblPerson (ID, Name, Email, GenderID) VALUES 
(2, 'Simon', 's@s.com', 2);



/*
Options when setting up Cascading referential integrity constraint
1. No Action: This is the default behaviour. No Action specifies that if an attempt is made to delete or update a row with key referenced by foreign keys in existing rows in other tables rows in other tables, an error is raised and the DELETE or UPDATE is rolled back

2. Cascade: Specifies that if an attempt is made to delete or update a row with a key referenced ny foreign keys in existing rows in other tables, all rows containing those foreign keys are also deleted or updated.

3. Set NULL: Specifies that if an attempt is made to delete or update a row with a key referenced by foreign keys in existing rows in other tables, all rows containing those foreign keys are set to NULL.

4. Set Default: Specifies that if an attempt is made to delete or update a row with a key referenced by foreign keys in existing rows in other tables, all rows containing those foreign keys are set to default values.

*/

/*
# Part 5 – Cascading Referential Integrity Constraint (Interview Questions)

## Basic Questions

1. What is Cascading Referential Integrity?
2. Why do we use Cascading Referential Integrity Constraints?
3. What is the purpose of Cascading Referential Integrity?
4. What problem does Cascading Referential Integrity solve?
5. What is an orphan record?
6. What happens when a parent record is deleted without Cascading Referential Integrity?

## Cascade Options

7. What are the different Cascading Referential Integrity options available in SQL Server?
8. What is the default action for a Foreign Key Constraint?
9. What does **NO ACTION** mean?
10. What does **CASCADE** mean?
11. What does **SET NULL** mean?
12. What does **SET DEFAULT** mean?
13. What is the difference between **NO ACTION** and **CASCADE**?
14. What is the difference between **SET NULL** and **SET DEFAULT**?
15. Which Cascading option would you use to automatically delete child records?
16. Which Cascading option would you use to preserve child records by setting the Foreign Key to NULL?
17. Which Cascading option would you use to assign a default value to child records?

## Practical Questions

18. How do you create a Foreign Key with **ON DELETE CASCADE**?
19. How do you create a Foreign Key with **ON UPDATE CASCADE**?
20. How do you create a Foreign Key with **ON DELETE SET NULL**?
21. How do you create a Foreign Key with **ON DELETE SET DEFAULT**?
22. Can we use different actions for DELETE and UPDATE on the same Foreign Key?

## Scenario-Based Questions

23. What happens if you delete a parent record when the Foreign Key uses **NO ACTION**?
24. What happens if you delete a parent record when the Foreign Key uses **CASCADE**?
25. What happens if you delete a parent record when the Foreign Key uses **SET NULL**?
26. What happens if you delete a parent record when the Foreign Key uses **SET DEFAULT**?
27. What happens if the Foreign Key column is defined as **NOT NULL** and **SET NULL** is used?
28. What happens if no default value exists and **SET DEFAULT** is used?
29. Can **SET NULL** be used if the Foreign Key column does not allow NULL values?
30. Can **SET DEFAULT** be used without a Default Constraint?

## Concept Questions

31. Can Cascading Referential Integrity be applied only to DELETE operations?
32. Can Cascading Referential Integrity also be applied to UPDATE operations?
33. What is the difference between **ON DELETE CASCADE** and **ON UPDATE CASCADE**?
34. Can multiple tables be affected by a single CASCADE operation?
35. What are the advantages of Cascading Referential Integrity?
36. What are the disadvantages of using CASCADE?
37. In which situations should you avoid using CASCADE?

## Real-World Questions

38. Where is Cascading Referential Integrity used in real-world applications?
39. Give a real-world example of **CASCADE**.
40. Give a real-world example of **SET NULL**.
41. Give a real-world example of **SET DEFAULT**.
42. How does Cascading Referential Integrity help maintain data consistency?

# ⭐ Most Important Questions (Freshers)

1. What is Cascading Referential Integrity?
2. Why do we use Cascading Referential Integrity?
3. What is an orphan record?
4. What are the four Cascading Referential Integrity options?
5. What is the default action of a Foreign Key Constraint?
6. Explain **NO ACTION**, **CASCADE**, **SET NULL**, and **SET DEFAULT**.
7. What happens when a parent record is deleted using **CASCADE**?
8. What is the difference between **CASCADE** and **SET NULL**?
9. What is the difference between **ON DELETE CASCADE** and **ON UPDATE CASCADE**?
10. Write the SQL syntax to create a Foreign Key with **ON DELETE CASCADE**.

*/