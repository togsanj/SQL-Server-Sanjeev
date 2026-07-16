-- CHECK constraint 

-- In this session we will learn CHECK constraint 

/* 
Check Constraint : 
               CHECK constraint is used to limit the range of the values, that can be entered for a column.
*/

    -- The general formula for adding check constraint in SQL Server:
    ALTER TABLE {TABLE_NAME}
    ADD CONSTRAINT {CONSTRAINT_NAME} CHECK {BOOLEAN_EXPRESSION}

    /*
    iF THE BOOLEAN_EXPRESSION returns true, then the CHECK constraint allows the value,
    otherwise it doesn't. Since, AGE is a nullable column, it's possible to pass null for this 
    column, when inserting a row. When you pass NULL for the AGE column, the boolean expression evaluates to UNKNOWN, and allows the value.
    */

    --To drop the CHECK constraint
    ALTER TABLE tblPerson
    DROP CONSTRAINT CK_tblPerson_Age

    CREATE DATABASE Part6Sample;

    USE [Part6Sample]
    GO


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
    Gender NVARCHAR(50) NOT NULL
    );

    ALTER TABLE tblPerson 
    ADD CONSTRAINT tblPerson_GenderID_FK
    FOREIGN KEY (GenderID) REFERENCES tblGender(ID);
    
    ALTER TABLE tblPerson
    ADD Age INT NULL;

    ALTER TABLE tblPerson
    ALTER COLUMN Age INT NULL;

    INSERT INTO tblPerson (ID, Name, Email, GenderID, Age)
    VALUES
    (1, 'John', 'j@j.com',NULL ,NULL ),
    (2, 'Ron', 'mr.com', 1, NULL),
    (3, 'Rich','r@r.com', NULL, NULL );


    INSERT INTO tblGender (ID, Gender) 
    VALUES 
    (1, 'Male'),
     (2, 'Female'),
     (3, 'Unknown');
   
    
    SELECT * FROM tblPerson;

    INSERT INTO tblPerson VALUES (5, 'Sara', 's@s.com', 2, 950)

    DELETE FROM tblPerson WHERE ID =4;

    ALTER TABLE tblPerson 
    DROP CONSTRAINT CK_tblPerson_Age

    ALTER TABLE tblPerson
    ADD CONSTRAINT CK_tblPerson_Age CHECK (AGE > 0 AND AGE < 150)

    ALTER TABLE tblPerson
    ADD CONSTRAINT DF_tblPerson_GenderID
    DEFAULT 3 FOR GenderID;