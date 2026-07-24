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

 /*
 # Part 18 – Stored Procedures (Interview Questions)

## Basic Questions

1. What is a Stored Procedure?
2. Why do we use Stored Procedures?
3. What are the advantages of Stored Procedures?
4. What is the syntax for creating a Stored Procedure?
5. Which statements are used to create a Stored Procedure?
6. What is Transact-SQL (T-SQL)?
7. Where are Stored Procedures stored?

## Creating & Executing Stored Procedures

8. How do you create a Stored Procedure?
9. How do you execute a Stored Procedure?
10. What are the different ways to execute a Stored Procedure?
11. Can a Stored Procedure be executed without using the `EXEC` keyword?
12. How do you pass parameters to a Stored Procedure?
13. Can parameters be passed by position and by name?
14. Which execution style is better: positional parameters or named parameters? Why?

## Parameter Questions

15. What is a parameter in a Stored Procedure?
16. Why do parameter names start with `@`?
17. Can a Stored Procedure have multiple input parameters?
18. What data types can be used for Stored Procedure parameters?
19. Can parameter values be supplied in any order when using named parameters?

## Managing Stored Procedures

20. How do you modify an existing Stored Procedure?
21. Which statement is used to alter a Stored Procedure?
22. How do you delete a Stored Procedure?
23. What is the difference between `CREATE PROCEDURE` and `ALTER PROCEDURE`?
24. What happens if you execute `CREATE PROCEDURE` with an existing procedure name?

## Viewing Stored Procedures

25. How do you view the source code of a Stored Procedure?
26. What is `sp_helptext`?
27. What does `sp_helptext` return?
28. Can you view the text of every Stored Procedure?

## Encryption Questions

29. What is the `WITH ENCRYPTION` option?
30. Why do we use `WITH ENCRYPTION`?
31. What happens after encrypting a Stored Procedure?
32. Can `sp_helptext` display the code of an encrypted Stored Procedure?
33. Can an encrypted Stored Procedure be decrypted easily?

## Naming Convention Questions

34. Why does Microsoft recommend not using the `sp_` prefix for user-defined Stored Procedures?
35. What problems can occur if user-defined procedures use the `sp_` prefix?

## Comparison Questions

36. What is the difference between a Stored Procedure and a normal SQL query?
37. What is the difference between a Stored Procedure and a function? *(Basic difference only)*
38. What is the difference between parameters and variables in a Stored Procedure?

## Scenario-Based Questions

39. When should you use a Stored Procedure instead of writing SQL queries repeatedly?
40. Where are Stored Procedures used in real-world applications?
41. What are the benefits of using Stored Procedures in large applications?
42. Why are Stored Procedures considered reusable?

## Real-World Questions

43. Give a real-world example of a Stored Procedure.
44. What are the advantages of Stored Procedures in banking, e-commerce, or HR systems?
45. What are the limitations of Stored Procedures?

# ⭐ Most Important Questions (Freshers)

1. What is a Stored Procedure?
2. Why do we use Stored Procedures?
3. What are the advantages of Stored Procedures?
4. How do you create a Stored Procedure?
5. How do you execute a Stored Procedure?
6. How do you pass parameters to a Stored Procedure?
7. What is the difference between `CREATE PROCEDURE` and `ALTER PROCEDURE`?
8. What is `sp_helptext`?
9. What is the purpose of the `WITH ENCRYPTION` option?
10. Why does Microsoft recommend not using the `sp_` prefix for user-defined Stored Procedures?
*/