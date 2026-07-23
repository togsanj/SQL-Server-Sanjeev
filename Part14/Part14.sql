-- SELF JOIN

CREATE DATABASE Part14Sample;

USE Part14Sample;
GO

/*
In this session we will learn 

1.Joining a table with iyself - Self Join
2.Self Join can be classified as
  -- Inner Self Join
  -- Outer Self Join (Left, Right and Full)
  -- Cross Self Join

  Pre-requisite:
  Part 12 - Joins in SQL Server
  Part 13 - Advanced Joins in SQL Server

  */

  CREATE TABLE tblEmployee 
  (
  EmployeeID INT PRIMARY KEY,
  Name NVARCHAR(50) NOT NULL,
  ManagerId INT
  )

  INSERT INTO tblEmployee (EmployeeID,Name, ManagerID) VALUES 
  (1, 'Mike', 3),
  (2, 'Rob', 1),
  (3, 'Todd', NULL),
  (4, 'Ben', 1),
  (5, 'Sam', 1);

  /*
  Self Join 
  In parts 12 and 13, we have seen joining 2 different tables - tblEmployees and tblDepartments.
  Have you ever thought of a need to join a table with itself
  */

  -- LEFT OUTER SELF JOIN
  SELECT    E.Name AS Employee, M.Name AS Manager
  FROM      tblEmployee E
  LEFT JOIN tblEmployee M
  ON        E.ManagerId = M.EmployeeId

  SELECT * FROM tblEmployee;

  -- INNER SELF JOIN 
  SELECT E.Name AS Employee, M.Name AS Manager
  FROM tblEmployee E
  INNER JOIN tblEmployee M
  ON E.ManagerId = M.EmployeeId

 -- CROSS SELF JOIN 
 SELECT E.Name AS Employee, M.Name AS Manager
 FROM tblEmployee E
 CROSS JOIN tblEmployee M;

 /*
 Joining a table with itself is called as SELF JOIN

 SELF JOIN is not a different type of JOIN

 It can be classified under any type of JOIN:
 1. INNER 
 2.OUTER(Left, Right, Full)
 3. CROSS Joins

 */

