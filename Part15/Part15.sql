-- Different ways to replace NULL in SQL Server
/*
In this session we will learn 
Different ways to replace NULL values 
   ISNULL() function
   CASE statement
   COALESCE() function

   Pre-requisite:
   Part 14 - Self Join in SQL Server
   

   Replacing NULL VALUES 
   Three ways to replace NULL values - ISNULL() Function, CASE Statement & COALESCE() Function 
   */

   CREATE DATABASE Part15Sample;

   USE [Part15Sample];
   GO

   CREATE TABLE tblEmployee 
   (
   EmployeeID INT PRIMARY KEY,
   Name NVARCHAR(50) NOT NULL,
   ManagerID INT
   )

   INSERT INTO tblEmployee (EmployeeID, Name, ManagerId) VALUES 
   (1, 'Mike', 3),
   (2, 'Rob', 1),
   (3, 'Todd', NULL),
   (4, 'Ben', 1),
   (5, 'Sam', 1)

   SELECT ISNULL(NULL, 'No Manager') AS Manager

   SELECT ISNULL('SANJEEV', 'No Manager') AS Manager

   SELECT COALESCE('Sanjeev', 'No Manager') AS Manager

   SELECT COALESCE(NULL, 'No Manager') AS Manager


   SELECT 
     E.Name AS Employee, 
     ISNULL (M.Name, 'No Manager') AS Manager
   FROM tblEMployee E
   LEFT JOIN tblEmployee M
   ON    E.ManagerID = M.EmployeeID


SELECT 
    E.Name AS Employee, 
    CASE 
        WHEN M.Name IS NULL THEN 'No Manager' 
        ELSE M.Name 
    END AS Manager
FROM  tblEmployee E
LEFT JOIN   tblEmployee M
ON E.ManagerID = M.EmployeeID


SELECT E.Name AS Employee, COALESCE(M.Name, 'No Manager') AS Manager
FROM tblEmployee E
LEFT JOIN tblEmployee M
ON E.ManagerID = M.EmployeeID


