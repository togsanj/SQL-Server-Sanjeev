-- Stored Procedures
/*
In this session we will learn 
 What is stored procedure
 Stored Procedure example 
 Creating a stored procedure with parameters
 Altering SP
 Viewing the text of the SP
 Dropping the SP


 A stored procedure is group of T-SQl(Transact SQL) statements. If you have a situation, where 
 you with the same query over and over again, you can save that specific query as a stored 
 procedure and call it just by it's name.


1. Use CREATE PROCEDURE or CREATE PROC statement to create SP
Note: When naming user defined stored procedures. Microsoft recommends not to use sp_as a prefix. All system stored procedures, are prefixed with sp_. This avoids any ambiguity between user defined and system stored procedures and any conflicts, with some future system procedure.

To execute the stored procedure
1.spGetEmployees
2.EXEC spGetEmployee
3.Execute spGetEmployee

Note: You can also right click on the procedure name, in object explorer in SQL Server Management Studio and select EXECUTE STORED PROCEDURE.

 */

 CREATE DATABASE Part18Sample;

 USE Part18Sample
 GO

 CREATE TABLE tblEmployee 
 (Id INT PRIMARY KEY,
 Name NVARCHAR(50) NOT NULL,
 Gender NVARCHAR(50) NOT NULL,
 DepartmentId INT
 )
 
 INSERT INTO tblEmployee (Id, Name, Gender, DepartmentId)  VALUES 
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

 SELECT * FROM tblEMployee



 ALTER PROCEDURE spGetEmployees
 AS
 BEGIN
     SELECT Name, Gender FROM tblEmployee ORDER BY Name
 END

 spGetEmployees;

 /*
 Stored Procedure with Parameters
 Parameters and variables have an @ prefix in their name.

 To Execute:
 EXECUTE spGetEmployeesByGenderAndDepartment 'Male', 1
 EXECUTE spGetEmployeesByGenderAndDepartment@DepartmentId=1,@Gender='Male'

 To view the text, of the stored procedure
 1.Use system stored procedure sp_helptext 'SPName'
                OR
 2. Right Click the SP in Object explorer->Scrip Procedure as -> Create To-> New Query Editor Window

 To change the stored procedure, use ALTER PROCEDURE statement.

 To delete the SP, use DROP PROC 'SPName' or DROP PROCEDURE 'SPName'

 To encrypt the text of the SP, use WITH ENCRYPTION option. It is not possible to view the text of an encrypt SP.

 Next Session - Creating and Invoking a stored procedure with output parameteres
 */

spGetEmployeesByGenderAndDepartment 'Male', 1

spGetEmployeesByGenderAndDepartment 'Male', 2

spGetEmployeesByGenderAndDepartment @DepartmentId =1, @Gender='Male'

 ALTER PROC spGetEmployeesByGenderAndDepartment
 @Gender NVARCHAR(50),
 @DepartmentId INT
 AS
 Begin
    SELECT Name, Gender, DepartmentId FROM tblEmployee WHERE Gender = @Gender
    AND DepartmentId = @DepartmentId
 END

 SELECT * FROM tblEmployee

 sp_helptext spGetEmployees

 DROP PROC spGetEmployees

 sp_helptext  spGetEmployeesByGenderAndDepartment

  ALTER PROC spGetEmployeesByGenderAndDepartment  
 @Gender NVARCHAR(50),  
 @DepartmentId INT  
 WITH Encryption
 AS  
 Begin  
    SELECT Name, Gender, DepartmentId FROM tblEmployee WHERE Gender = @Gender  
    AND DepartmentId = @DepartmentId  
 END