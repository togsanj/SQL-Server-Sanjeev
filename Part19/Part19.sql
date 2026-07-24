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
@Gender NVARCHAR(20),     --Input Parameter
@EmployeeCount INT OUTPUT  -- Output Parameter
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

-- ## INTERVIEW PREPARATION ##
/*
## ## Stored Procedure & OUTPUT Parameter

1. What is an OUTPUT Parameter?
2. Why do we use OUTPUT Parameters in Stored Procedures?
3. What is the syntax for creating an OUTPUT Parameter?
4. Which keywords are used to declare an OUTPUT Parameter (OUT or OUTPUT)?
5. What is the difference between an Input Parameter and an OUTPUT Parameter?
6. How do you create a Stored Procedure with an OUTPUT Parameter?
7. How do you execute a Stored Procedure with an OUTPUT Parameter?
8. How do OUTPUT Parameters return values to the caller?
9. Why do we declare a variable before executing a Stored Procedure with an OUTPUT Parameter?
10. Why do we specify the OUTPUT keyword while creating the Stored Procedure?
11. Why do we specify the OUTPUT keyword while executing the Stored Procedure?
12. What happens if the OUTPUT keyword is omitted while executing the Stored Procedure?
13. Can we pass parameters by position and by name while executing a Stored Procedure?
14. What are positional parameters?
15. What are named parameters?
16. What is the difference between positional parameters and named parameters?
17. Can named parameters be passed in any order?
18. Can positional parameters be passed in any order?
19. Which execution style is better: positional parameters or named parameters? Why?
20. Can we mix positional parameters and named parameters in the same Stored Procedure call?
21. Can a Stored Procedure have multiple OUTPUT Parameters?
22. Can a Stored Procedure have both Input and OUTPUT Parameters?
23. What data types can be used with OUTPUT Parameters?
24. Can OUTPUT Parameters return NULL values?
25. Can OUTPUT Parameters return multiple values?

## Practical Questions

26. Write a Stored Procedure to return the total number of Male employees using an OUTPUT Parameter.
27. Write a Stored Procedure to return Employee Name using an OUTPUT Parameter.
28. Write a Stored Procedure with two OUTPUT Parameters.
29. Write a Stored Procedure with one Input Parameter and one OUTPUT Parameter.
30. Execute a Stored Procedure using positional parameters.
31. Execute a Stored Procedure using named parameters.

## Scenario-Based Questions

32. When should you use an OUTPUT Parameter?
33. Where are OUTPUT Parameters used in real-world applications?
34. What happens if the query inside the Stored Procedure returns no rows?
35. What happens if an OUTPUT Parameter is never assigned a value?
36. What happens if the caller variable datatype doesn't match the OUTPUT Parameter datatype?
37. Why is an OUTPUT Parameter better than using only a SELECT statement in some scenarios?

## System Stored Procedure Questions

38. What is `sp_help`?
39. What information does `sp_help` return?
40. Can `sp_help` be used only with Stored Procedures?
41. What is the shortcut key for `sp_help` in SQL Server Management Studio?
42. What is `sp_helptext`?
43. What is `sp_helptext` used for?
44. What is `sp_depends`?
45. Why is `sp_depends` useful before dropping a table or another database object?
46. Can `sp_depends` be used with tables as well as Stored Procedures?

---

# ⭐ Most Important Questions (Freshers) – Part 19

1. What is an OUTPUT Parameter?
2. Why do we use OUTPUT Parameters?
3. What is the difference between an Input Parameter and an OUTPUT Parameter?
4. How do you create a Stored Procedure with an OUTPUT Parameter?
5. How do you execute a Stored Procedure with an OUTPUT Parameter?
6. Why do we use the `OUTPUT` keyword while executing the Stored Procedure?
7. What happens if the `OUTPUT` keyword is omitted while executing the Stored Procedure?
8. What is the difference between positional parameters and named parameters?
9. Which execution style is better: positional parameters or named parameters? Why?
10. Can named parameters be passed in any order?
11. Can a Stored Procedure have multiple OUTPUT Parameters?
12. What are `sp_help`, `sp_helptext`, and `sp_depends`? Explain their purpose.
13. Write a Stored Procedure that returns Employee Count using an OUTPUT Parameter.
*/