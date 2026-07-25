-- Advantages of stored procedures
/*
In this session we will learn 
Advantages of using Stored Procedures over adhoc queries (Inline SQL)

Pre-requisite:
Part 18 - Stored procedures in SQL Server

Advantages of Stored Procedures 

1. Execution plan retention and reusability
2. Reduces network traffic
3. Code reusability and better maintainability
4. Btter Security
5. Avoids SQL Injection attack

What is SQL Injection attack and how to prevent it?
https://www.youtube.com/watch?v=uSw0IoSr3Hk 
*/

CREATE DATABASE Part21Sample;

USE Part21Sample;
GO

CREATE TABLE tblEmployee
(
Id INT PRIMARY KEY,
Name NVARCHAR(50) NOT NULL,
Gender NVARCHAR(50) NOT NULL
)

INSERT INTO tblEmployee (Id, Name, Gender) VALUES 
(1, 'Sam', 'Female'),
(2, 'John', 'Male'),
(3, 'Pam', 'Female')



SELECT * FROM tblEmployee;

CREATE PROC spGetNameById
@Id INT
AS
BEGIN
  SELECT Name FROM tblEmployee WHERE Id = @Id
END

EXECUTE spGetNameById 1
EXECUTE spGetNameById 2

SELECT Name FROM tblEmployee WHERE Id =1;
SELECT Name FROM tblEmployee WHERE Id =2;

/*
1. What is a Stored Procedure?
2. What is an Ad Hoc Query (Inline SQL)?
3. What is the difference between a Stored Procedure and an Ad Hoc Query?
4. What are the advantages of Stored Procedures over Ad Hoc Queries?
5. What is an Execution Plan in SQL Server?
6. What is Execution Plan Reuse?
7. How does Execution Plan Reuse improve performance?
8. How do Stored Procedures reduce network traffic?
9. How do Stored Procedures improve code reusability?
10. Why are Stored Procedures easier to maintain?
11. How do Stored Procedures provide better security?
12. How do Stored Procedures help prevent SQL Injection attacks?
13. Are Stored Procedures completely safe from SQL Injection?
14. What is parameterization in Stored Procedures?
15. What permissions can be granted on a Stored Procedure?
16. Can a user execute a Stored Procedure without direct access to the underlying tables?
17. What happens when a Stored Procedure is executed for the first time?
18. Where does SQL Server store the execution plan of a Stored Procedure?
19. What is the purpose of the EXEC or EXECUTE command?
20. What is the difference between EXEC and EXECUTE?
21. Can Stored Procedures accept input parameters?
22. Can a Stored Procedure return data?
23. Can a Stored Procedure contain multiple SQL statements?
24. When should you use a Stored Procedure instead of an Ad Hoc Query?
25. Which is better for enterprise applications: Stored Procedures or Ad Hoc Queries? Why?