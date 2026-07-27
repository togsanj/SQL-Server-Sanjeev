--Inline Table Valued Functions
/*
In this session we will learn
  Creating Inline Table Valued Function
  How to call an Inline Table Valued Function
  Where do we use inline table valued functions

  Pre-requisite
  part 30 - User Defined Functions

  Inline Table Valued Functions
  In part 30 of this lecture series we have seen how to create and call 'scalar user defined functions'. in this part, we will learn about 'Inline Table  Valued Functions'

  SCALAR FUNCTION - RETURNS A SCALAR VALUE
  INLINE TABLE VALUED FUNCTION - RETURNS A TABLE

  CREATE FUNCTION fn_EmployeeByGender(@Gender NVARCHAR(10))
  RETURNS TABLE
  AS
  RETURN (SELECT Id, Name, DateOfBirth, Gender, DepartmentId)
          FROM tblEmployees
          WHERE Gender = @Gender)

          1.We specify TABLE as the return type, instead of any scalar data type
          2.The  function body is not enclosed between BEGIN and END block.
          3.The structure of the table that gets returned is determined by the SELECT statement within the function.

          */

          CREATE DATABASE Part31Sample;

          USE Part31Sample;
          GO
          
     CREATE TABLE tblEmployees
    (
    Id INT PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    DateOfBirth DATETIME2 NOT NULL,
    Gender NVARCHAR(20) NOT NULL,
    DepartmentId INT NOT NULL
    );

     INSERT INTO tblEmployees (Id, Name, DateOfBirth, Gender, DepartmentId) VALUES 
   (1, 'Sam', '1980-12-30 00:00:00.000', 'Male', 1),
   (2, 'Pam', '1982-09-01 12:02:36.260','Female', 2),
   (3, 'John', '1985-08-22 12:03:30.370', 'Male', 1),
   (4, 'Sara', '1979-11-29 12:59:30.670', 'Female', 3),
   (5, 'Todd', '1978-11-29 12:59:30.670', 'Male', 1);

   SELECT * FROM tblEmployees;

   --CREATE THE FUNCTION
  /* CREATE FUNCTION fn_EmployeesByGender(@Gender NVARCHAR(10))
   RETURNS TABLE
   AS
   RETURN 
   (
   SELECT Id, Name, DateOfBirth, Gender, DepartmentId
   FROM tblEmployees
   WHERE Gender = @Gender
   )

   Inline Table Valued Functions
   Where can we use Inline Table Valued functions
   1.Inline Table Valued functions can be used to achieve the functionality of parameterized views. We will  talk about views, in a later session.
   2.The table returned by the table valued function, can also be used in joins with other tables.
   */
   --To call the function
   SELECT * FROM fn_EmployeesByGender('Male');

    SELECT * FROM fn_EmployeesByGender('Female') WHERE Name = 'Pam';

    CREATE TABLE tblDepartment
    (
    Id INT PRIMARY KEY,
    DepartmentName NVARCHAR(50) NOT NULL,
    Location NVARCHAR(50) NOT NULL,
    DepartmentHead NVARCHAR(50) NOT NULL
    );

    INSERT INTO tblDepartment (Id, DepartmentName, Location, DepartmentHead) VALUES
    (1, 'IT', 'London', 'Rick'),
    (2, 'Payroll', 'Delhi', 'Ron'),
    (3, 'HR', 'New York', 'Christie'),
    (4, 'Other Department', 'Sydney', 'Cindrella');

   SELECT Name, Gender, DepartmentName
   FROM fn_EmployeesByGender('Male') AS E
   JOIN tblDepartment AS D
   ON D.Id = E.DepartmentId;

   /*
   Joins:
   Part12: Joins in SQL Server
   Part 13: Advanced Joins
   */


   /*
   ## – Inline Table Valued Functions (Inline TVF) Interview Questions

1. What is an Inline Table Valued Function (Inline TVF) in SQL Server?
2. What is the difference between a Scalar Function and an Inline Table Valued Function?
3. What does an Inline Table Valued Function return?
4. What is the syntax to create an Inline Table Valued Function?
5. Why do we specify RETURNS TABLE in an Inline TVF?
6. Why doesn't an Inline TVF use BEGIN...END?
7. How is the structure of the returned table determined in an Inline TVF?
8. Can an Inline Table Valued Function accept parameters?
9. Can an Inline Table Valued Function be created without parameters?
10. How do you call an Inline Table Valued Function?
11. Can an Inline Table Valued Function be used in the FROM clause?
12. Can an Inline Table Valued Function be joined with other tables?
13. Can an Inline Table Valued Function be filtered using a WHERE clause?
14. What is a parameterized view, and how does an Inline TVF provide similar functionality?
15. What are the advantages of an Inline Table Valued Function?
16. What are the limitations of an Inline Table Valued Function?
17. Can an Inline Table Valued Function contain multiple SELECT statements?
18. Can an Inline Table Valued Function perform INSERT, UPDATE, or DELETE operations?
19. How do you modify an Inline Table Valued Function?
20. How do you drop an Inline Table Valued Function?
21. How do you view the source code of an Inline Table Valued Function?
22. What is the purpose of sp_helptext with an Inline TVF?
23. Write an Inline Table Valued Function to return employees based on gender.
24. Write a query to retrieve only male employees using an Inline TVF.
25. Write a query to join an Inline Table Valued Function with the Department table.
26. What is the difference between an Inline Table Valued Function and a View?
27. What is the difference between an Inline Table Valued Function and a Multi-Statement Table Valued Function?
28. When should you use an Inline Table Valued Function instead of a View?
29. Can an Inline Table Valued Function call another User Defined Function?
30. Can an Inline Table Valued Function be used inside another query?

*/