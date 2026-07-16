Cascading referential integrity constraint 


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