-- Stored procedure output parameters or return values
/*
In this session we will learn
1.Understand what are stored rpcedure retrun values
2.Difference between stored procedure return values and output parameters
3.When to use output parameters over return values

Pre-requisite:
Part 18 - Stored procedures in SQL Server
Part 19 - Stored procedure with output parameters

Output Parameters or Return Values
Whenever, you execute a stored procedure, it returns an integer status variable. Usually, zero
indicates success, and non-zero indicates failure.
    */

    /*
CREATE PROCEDURE spGetTotalCountOfEmployees1
@TotalCount INT OUTPUT
AS
BEGIN
   SELECT @TotalCount = COUNT(Id) FROM tblEmployee
END

Declare Procedure spGetTotalCountOfEmployees2
EXECUTE spGetTotalCountOfEmployees @TotalEmployees OUTPUT
SELECT @TotalEmployees

CREATE PROCEDURE spGetTotalCountOfEmployees2
AS
BEGIN
 RETURN (SELECT COUNT(ID) FROM Employee)
 END

 Declare @TotalEmployees INT
 EXECUTE @TotalEmployees = spGetTotalCountOfEmployees2
 SELECT @TotalEmployees
 */

 /*
 So, we are able to achieve what we want, using output parameters as well as retrun values.

 Now, let's look at example, where return status variables cannot be used, but Output parameters ca be used.
 */

 CREATE DATABASE Part20Sample;

 USE Part20Sample
 GO

 CREATE TABLE tblEmployee
 (
 Id INT PRIMARY KEY,
 Name NVARCHAR(50) NOT NULL,
 Gender NVARCHAR(50) NOT NULL,
 DepartmentId INT
 )

 INSERT INTO tblEmployee (Id, Name, Gender, DepartmentId) VALUES
  (1, 'Sam', 'Male', 1),
  (2, 'Rai', 'Male', 1),
  (3, 'Sara', 'Female', 3),
  (4, 'Todd', 'Male', 2),
  (5, 'John', 'Male', 3),
  (6, 'Sana', 'Female', 2),
  (7, 'James', 'Male', 1),
  (8, 'Rob', 'Male', 2),
  (9, 'Steve', 'Male', 1),
  (10, 'Pam', 'Female', 2);

  SELECT * FROM tblEmployee;

  /*
  CREATE PROC spGetNameById
  @Id INT,
  @Name NVARCHAR(20) OUTPUT
  AS
   BEGIN
     SELECT @Name = Name FROM tblEmployee WHERE Id = @Id
   END;
   */

   CREATE PROC spGetTotalCount1
   @TotalCount INT OUT
   AS
   BEGIN
      SELECT @TotalCount = COUNT(Id) FROM tblEmployee
    END

    Declare @Total INT
    Execute spGetTotalCount1 @Total OUT
    PRINT @Total 


   CREATE PROC spGetTotalCount2
   AS
   BEGIN
       return (SELECT COUNT(Id) FROM tblEmployee)
   END

   Declare @Total INT
   EXECUTE @Total = spGetTotalCount2
   PRINT @Total


   CREATE PROC spGetNameById1
   @Id INT,
   @Name NVARCHAR(20) OUTPUT
   AS
   BEGIN
     SELECT @Name = Name FROM tblEmployee WHERE Id = @Id
   END

   Declare @Name NVARCHAR(20)
   EXECUTE spGetNameById1 1, @Name OUT
   PRINT 'Name = '+ @Name

   CREATE PROC spGetNameById2
   @Id INT
   AS
   BEGIN 
    return (SELECT Name FROM tblEmployee WHERE Id = @Id)
   END

   Declare @Name NVARCHAR(20)
   Execute @Name = spGetNameById2 1
   Print 'Name = ' + @Name
   /*
   OUTPUT Parameters or Return Values

   Return status Value              |  Output Parameters
   Only Integer Datatype            |   Any Datatype
   Only One value                   |  More than value
   Use to convey success or failure |  Use to return value like name, count etc.
   */



/*
           Introduction
1.What is a Stored Procedure Return Value?
2.What is an OUTPUT Parameter?
3.What is the difference between an Input Parameter and an OUTPUT Parameter?
          OUTPUT Parameters
4.Why do we use OUTPUT Parameters?
5.Why do we write the OUTPUT keyword while creating a Stored Procedure?
6.Why do we write the OUTPUT keyword while executing a Stored Procedure?
7.What happens if we don't use the OUTPUT keyword while executing the procedure?
8.Can a Stored Procedure have multiple OUTPUT Parameters?
9.What data types are supported by OUTPUT Parameters?
10.Can OUTPUT Parameters return multiple values?
11.Can OUTPUT Parameters return NULL values?
12.What happens if an OUTPUT Parameter is not assigned any value inside the procedure?
13.What happens if the caller variable datatype doesn't match the OUTPUT Parameter datatype?
            Return Values
14.Why do we use Return Values?
15.What data type can a RETURN statement return?
16.Can a RETURN statement return a string, DATE, DECIMAL, or FLOAT? Why?
17.Can a RETURN statement return multiple values?
18.What is the default Return Value of a Stored Procedure?
              Comparison
19.What is the difference between OUTPUT Parameters and Return Values?
20.When should we use OUTPUT Parameters instead of Return Values?
21.When should we use Return Values instead of OUTPUT Parameters?
22.Can we use OUTPUT Parameters and Return Values together in the same Stored Procedure?
          
          Error & Scenario Based
23.Why does the following code generate an error?
RETURN (SELECT Name FROM tblEmployee WHERE Id = @Id)

24.Why does the following code work?
RETURN (SELECT COUNT(*) FROM tblEmployee)

25.What happens if the SELECT statement inside an OUTPUT Parameter returns no rows?
         Practical / Coding
26.Write a Stored Procedure that returns Employee Count using an OUTPUT Parameter.
27.Write a Stored Procedure that returns Employee Name using an OUTPUT Parameter.
28.Write a Stored Procedure that returns multiple values (Name, Gender, Department) using OUTPUT Parameters.
29.Write a Stored Procedure that returns Success (0) or Failure (1) using RETURN.
30.Write a Stored Procedure that uses both OUTPUT Parameters and RETURN Values together.
        Real-Time Scenarios
31.If you need to return Employee Name, Salary, and Department, which approach will you use and why?
32.If you need to return only the execution status (Success/Failure), which approach will you use and why?
33.Where are OUTPUT Parameters used in real-world applications?
34.Where are Return Values used in real-world applications?

*/

--⭐ Top 15 Interview Questions (Most Frequently Asked)
/*
1.What is an OUTPUT Parameter?
2.What is a Return Value?
3.Why do we use OUTPUT Parameters?
4.Why do we use Return Values?
5.What is the difference between OUTPUT Parameters and Return Values?
6.Why do we write the OUTPUT keyword while executing the Stored Procedure?
7.What data type can a RETURN statement return?
8.Can a RETURN statement return a string? Why?
9.Can a Stored Procedure have multiple OUTPUT Parameters?
10.Can OUTPUT Parameters return multiple values?
11.Can we use OUTPUT Parameters and Return Values together?
12.When should we use OUTPUT Parameters instead of Return Values?
13.What happens if we don't use the OUTPUT keyword while executing the procedure?
14.Why does RETURN (SELECT Name...) generate an error?
15.Write a Stored Procedure using an OUTPUT Parameter.
*/