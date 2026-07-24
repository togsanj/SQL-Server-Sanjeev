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

    /*
    # Part 6 – CHECK Constraint (Interview Questions)

## Basic Questions

1. What is a CHECK Constraint?
2. Why do we use a CHECK Constraint?
3. What is the purpose of a CHECK Constraint?
4. What is the syntax for creating a CHECK Constraint?
5. Can a table have multiple CHECK Constraints?
6. Can a CHECK Constraint be applied to multiple columns?
7. Which data types can use a CHECK Constraint?

## Concept Questions

8. How does a CHECK Constraint work?
9. What kind of expressions can be used in a CHECK Constraint?
10. What happens if the CHECK condition evaluates to **TRUE**?
11. What happens if the CHECK condition evaluates to **FALSE**?
12. What happens if the CHECK condition evaluates to **UNKNOWN (NULL)**?
13. Why does SQL Server allow NULL values even when a CHECK Constraint exists?
14. Can a CHECK Constraint prevent duplicate values?
15. Can a CHECK Constraint reference another table?
16. Can a CHECK Constraint contain logical operators such as `AND`, `OR`, and `NOT`?
17. Can a CHECK Constraint use comparison operators (`>`, `<`, `>=`, `<=`, `=`, `<>`)?

## Practical Questions

18. How do you add a CHECK Constraint to an existing table?
19. How do you create a CHECK Constraint while creating a table?
20. How do you drop a CHECK Constraint?
21. How do you modify an existing CHECK Constraint?
22. How do you find the name of a CHECK Constraint?

## Scenario-Based Questions

23. What happens if you insert a value that violates a CHECK Constraint?
24. What happens if you update a row with a value that violates a CHECK Constraint?
25. What happens if you insert a NULL value into a column that has a CHECK Constraint?
26. What happens if existing data violates the CHECK Constraint while adding it to a table?
27. Can a CHECK Constraint be used together with a DEFAULT Constraint?
28. Can a CHECK Constraint be used together with a FOREIGN KEY Constraint?
29. Can a CHECK Constraint be used on a nullable column?

## Comparison Questions

30. What is the difference between a CHECK Constraint and a DEFAULT Constraint?
31. What is the difference between a CHECK Constraint and a NOT NULL Constraint?
32. What is the difference between a CHECK Constraint and a FOREIGN KEY Constraint?
33. What is the difference between a CHECK Constraint and a UNIQUE Constraint?

## Real-World Questions

34. Where are CHECK Constraints used in real-world applications?
35. Give a real-world example of a CHECK Constraint.
36. What are the advantages of using CHECK Constraints?
37. What are the limitations of CHECK Constraints?

# ⭐ Most Important Questions (Freshers)

1. What is a CHECK Constraint?
2. Why do we use a CHECK Constraint?
3. What is the syntax for creating a CHECK Constraint?
4. What happens if the CHECK condition evaluates to TRUE, FALSE, or UNKNOWN?
5. Why does SQL Server allow NULL values with a CHECK Constraint?
6. How do you add a CHECK Constraint using `ALTER TABLE`?
7. How do you drop a CHECK Constraint?
8. What happens if you insert or update a value that violates a CHECK Constraint?
9. What is the difference between a CHECK Constraint and a DEFAULT Constraint?
10. Write the SQL syntax to create a CHECK Constraint for Age between 1 and 149.
*/