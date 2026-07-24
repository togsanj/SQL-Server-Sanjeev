-- Stored procedures with output parameters
/*
In this session we will learn 
Creating and executing stored procedures with output parameters
Learn about some of the useful system stored procedures

Pre-requisite:
Part 18 - Stored Procedures in SQL Server

*/

--Stored Procedures - Output Parameters
--To create an SP with output parameter, we use the keywords OUT or OUTPUT.

CREATE DATABASE Part19Sample;

USE [Part19Sample]
GO

CREATE TABLE tblEmployee
(
Id INT PRIMARY KEY,
Name NVARCHAR(50) NOT NULL,
Gender NVARCHAR(50) NOT NULL,
DepartmentId INT NOT NULL
);


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
(10, 'Pam', 'Female', 2)


ALTER PROCEDURE spGetEmployeeCountByGender
@Gender NVARCHAR(20),
@EmployeeCount INT OUTPUT
AS
BEGIN
    SELECT @EmployeeCount = Count(Id)
    FROM tblEmployee
    WHERE Gender = @Gender
END

--To execute the stored procedure with output parameters

Declare @EmployeeTotal INT
EXECUTE spGetEmployeeCountByGender 'Male', @EmployeeTotal Output
PRINT @EmployeeTotal

Declare @EmployeeTotal INT
EXECUTE spGetEmployeeCountByGender @EmployeeCount = @EmployeeTotal OUT, @Gender = 'Male'
PRINT @EmployeeTotal

--If you don't specify the OUTPUT keyword, when executing the stored procedure, the @EmployeeTotal variable will be NULL





SELECT * FROM tblEmployee;

CREATE PROCEDURE spGetEmployeeCountByGender
@Gender NVARCHAR(20),
@EmployeeCount INT OUTPUT
AS
BEGIN
    SELECT @EmployeeCount = COUNT(Id) FROM tblEmployee WHERE Gender = @Gender
END

Declare @TotalCount INT 
Execute spGetEmployeeCountByGender 'Male', @TotalCount OUTPUT
if(@TotalCount IS NULL)
  PRINT '@TotalCount is null'
else
  PRINT '@TotalCount is not null'
PRINT @TotalCount 

Declare @TotalCount INT
EXECUTE spGetEmployeeCountByGender @EmployeeCount = @TotalCount out, @Gender = 'Male'
PRINT @TotalCount
/*
Useful system stored procedures

sp_help procedure_name - View the information about the stored procedure,
like parameters names, their datatypes etc. sp_help can be used with any database object, like tables, views, SP's, triggers etc. Alternatively, you can also press ALT+F!, when the name of the object is highlighted.

sp_helptext procedure_name - View the Text of the stored procedure
sp_depends procedure_name- View the dependencies of the stored procedure. This system SP is very useful
,especially if you want to check, if there are any stored procedures that are referencing a table that you are abput to drop. sp_depends can also be used with other database objects like table etc.

*/

sp_help spGetEmployeeCountByGender

sp_help 

tblEmployee   press Alt+F1

sp_helptext spGetEmployeeCountByGender

sp_depends spGetEmployeeCountByGender

sp_depends tblEmployee