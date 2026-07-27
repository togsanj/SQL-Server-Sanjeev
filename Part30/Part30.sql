--User defined functions
/*
In this session we will learn
User Defined Functions
Types of User Defined Functions
Creating a Scaler User Defined Function
Calling a Scaler User Defined Function
Places where we can use Scaler User Defined Function
Altering and Dropping User Defined Function
*/

/*
SCALAR UDF

from Parts 22 to 29, we have learnt how to use many of the system functions that are available in SQL Server. In this session, we will turn our attention, to creating user defined functions. In short UDF.

In SQL Server there are 3 types of User Defined functions
1.Scalar functions
2.Inline table-valued functions
3.Multi-statement table-valued functions

Scalar functions may or may not have parameters, but always return a single(scaler) value, The returned value can be of any data type, except text, ntext, image, cursor and timestamp

--To create a function, we use the following syntax:
CREATE FUNCTION Function_Name(@Parameter1 DataType, @Parameter2 DataType, @ParameterN DataType
RETURN Return_DataType
AS
BEGIN
  --Function Body
  Return Return_DataType
END
*/

CREATE DATABASE Part30Sample;

USE Part30Sample;
GO


  CREATE TABLE tblEmployees
    (
    Id INT PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    DateOfBirth DATETIME2 NOT NULL,
    )

       INSERT INTO tblEmployees (Id, Name, DateOfBirth) VALUES 
   (1, 'Sam', '1980-12-30 00:00:00.000'),
   (2, 'Pam', '1982-09-01 12:02:36.260'),
   (3, 'John', '1985-08-22 12:03:30.370'),
   (4, 'Sara', '1979-11-29 12:59:30.670')

   SELECT * FROM tblEmployees;


   SELECT SQUARE(3) 

SELECT GETDATE()

   /*
   DECLARE @DOB DATE
   DECLARE @Age INT
   SET @DOB = '10/08/2025'

   SET @Age =DATEDIFF(YEAR, @DOB, GETDATE())
   
   SELECT @Age
   */

   DECLARE @DOB DATE
   DECLARE @Age INT
SET @DOB = '2025-08-11'
SET @Age = DATEDIFF(YEAR, @DOB, GETDATE()) -
          CASE
           WHEN (MONTH(@DOB) > MONTH(GETDATE()) OR
                (MONTH(@DOB) = MONTH(GETDATE()) 
                AND DAY (@DOB) > DAY(GETDATE())))
         THEN 1
         ELSE 0
       END
SELECT @Age


CREATE FUNCTION CalculateAge(@DOB Date)
RETURNS INT
AS
BEGIN
DECLARE @Age INT

SET @Age = DATEDIFF(YEAR, @DOB, GETDATE()) -
          CASE
           WHEN (MONTH(@DOB) > MONTH(GETDATE()) OR
                (MONTH(@DOB) = MONTH(GETDATE()) 
                AND DAY (@DOB) > DAY(GETDATE())))
         THEN 1
         ELSE 0
       END
RETURN @Age
END


SELECT Part30Sample.dbo.CalculateAge('2002-10-08');



--When calling a scalar user-defined function, you must supply a two-part name,
--OwnerName.FunctionName 
--dbo stands for database owner.
SELECT dbo.CalculateAge('1982-10-08');

--You can also invoke it using the complete 3 part name, DatabaseName.OwnerName.FunctionName
SELECT Part30Sample.dbo.CalculateAge('1982-10-08');

--SCALAR UDF
--Scalar user defined functions can be used in the select clause
SELECT Id, Name, dbo.CalculateAge(DateOfBirth) AS Age FROM tblEmployees

--Scalar user defined functions can be used in the select where clause
SELECT Id, Name, dbo.CalculateAge(DateOfBirth) AS Age FROM tblEmployees
WHERE dbo.CalculateAge(DateOfBirth) > 30

--A stored procedure also can accept DateOfBirth and return Age, but you cannot use stored 
--procedures in a select or where clause. This is just one difference between a function and a 
--stored procedure. There are several other differences, which we will talk about in a later session.

--To alter a function we use ALTER FUNCTION FunctionNamestatement and to delete it, we use 
--DROP FUNCTION FunctionName. 


EXEC sp_helptext CalculateAge


CREATE PROC spCalculateAge
@DOB Date 
AS  
BEGIN  
DECLARE @Age INT  
  
SET @Age = DATEDIFF(YEAR, @DOB, GETDATE()) -  
          CASE  
           WHEN (MONTH(@DOB) > MONTH(GETDATE()) OR  
                (MONTH(@DOB) = MONTH(GETDATE())   
                AND DAY (@DOB) > DAY(GETDATE())))  
         THEN 1  
         ELSE 0  
       END  
SELECT @Age  
END



EXECUTE spCalculateAge '10/08/2005'

SELECT Id, Name, dbo.CalculateAge(DateOfBirth) AS Age
FROM tblEmployees

--SELECT Id, Name, dbo.spCalculateAge(DateOfBirth) AS Age FROM tblEmployees 

/*
Part 30 – User Defined Functions (Scalar UDF) Interview Questions

1. What is a User Defined Function (UDF) in SQL Server?
2. Why do we use User Defined Functions?
3. What are the types of User Defined Functions in SQL Server?
4. What is a Scalar User Defined Function?
5. What is the difference between a System Function and a User Defined Function (UDF)?
6. What is the syntax to create a Scalar User Defined Function?
7. What is the purpose of the RETURNS keyword?
8. Can a Scalar Function accept parameters?
9. Can a Scalar Function be created without parameters?
10. Can a Scalar Function return NULL?
11. Which data types cannot be returned by a Scalar Function?
12. How do you call a Scalar User Defined Function?
13. What is a two-part name in SQL Server?
14. What is a three-part name in SQL Server?
15. What does dbo represent in SQL Server?
16. When should you use a three-part name?
17. Can a Scalar Function be used in the SELECT clause?
18. Can a Scalar Function be used in the WHERE clause?
19. Can a Scalar Function be used in the ORDER BY clause?
20. Can one User Defined Function call another User Defined Function?
21. What is the difference between a Scalar Function and a Stored Procedure?
22. Why can't a Stored Procedure be used in a SELECT statement?
23. How do you alter a User Defined Function?
24. How do you drop a User Defined Function?
25. How do you view the source code of a User Defined Function?
26. What is the purpose of sp_helptext?
27. Write a Scalar Function to calculate Age from Date of Birth.
28. Write a query to display Employee Name and Age using a Scalar Function.
29. Write a query to display employees whose age is greater than 30 using a Scalar Function.
30. Can a Scalar User Defined Function modify data in a table?
*/