  -- Advanced JOINS

  /*
  In this session we will learn

  Advanced or intelligent joins in SQL Server
  Retrieve only the non matching rows from the left table
  Retrieve only the non matching rows from the right table
  Retrieve only the non matching rows from both the left and right table

  Pre-requisite
  Part 12 - Joins in SQL Server
  */

  CREATE DATABASE Part13Sample;

  USE [Part13Sample]
  GO

  CREATE TABLE tblEmployee 
  (
  ID INT PRIMARY KEY,
  Name NVARCHAR(50) NOT NULL,
  Gender NVARCHAR(50) NOT NULL,
  Salary INT NOT NULL,
  DepartmentId INT 
  )

  CREATE TABLE tblDepartment 
  (
  Id INT PRIMARY KEY,
  DepartmentName NVARCHAR(50) NOT NULL,
  Location NVARCHAR(50) NOT NULL,
  DepartmentHead NVARCHAR(50) NOT NULL
  )

  ALTER TABLE tblEmployee 
  ADD CONSTRAINT tblEmployee_tblDepartment_FK
  FOREIGN KEY (DepartmentId) REFERENCES tblDepartment(Id)

  SELECT * FROM tblEmployee;
  SELECT * FROM tblDepartment;

  INSERT INTO tblEmployee (ID, Name, Gender, Salary, DepartmentId)  VALUES 
  (1, 'Tom', 'Male', 4000, 1),
  (2, 'Pam', 'Female', 3000, 3),
  (3, 'John', 'Male', 3500, 1),
  (4, 'Sam', 'Male', 4500, 2),
  (5, 'Todd', 'Male', 2000, 2),
  (6, 'Ben', 'Male', 7000, 1),
  (7, 'Sara', 'Female', 4800, 3),
  (8, 'Valarie', 'Female', 5500, 1),
  (9, 'James', 'Male', 6500, NULL),
  (10, 'Rusell', 'Male',8800, NULL)


  INSERT INTO tblDepartment (Id, DepartmentName, Location, DepartmentHead) VALUES 
  (1, 'IT', 'London', 'Rick'),
  (2, 'Payroll', 'Delhi', 'Ron'),
  (3, 'HR', 'New York', 'Christie'),
  (4, 'Other Department', 'Sydney', 'Cindrella')

  SELECT * FROM tblEmployee;
  SELECT * FROM tblDepartment;

  SELECT      Name, Gender, Salary, DepartmentName
  FROM        tblEmployee 
  LEFT JOIN   tblDepartment 
  ON          tblEmployee.DepartmentId = tblDepartment.Id
  WHERE       tblEmployee.DepartmentId IS NULL

  SELECT      Name, Gender, Salary, DepartmentName
  FROM        tblEmployee 
  LEFT JOIN   tblDepartment
  ON          tblEmployee.DepartmentId = tblDepartment.Id
  WHERE       tblDepartment.Id IS NULL

  SELECT Name, Gender, Salary, DepartmentName
  FROM   tblEmployee 
  RIGHT JOIN  tblDepartment 
  ON  tblEmployee.DepartmentId = tblDepartment.Id
  WHERE tblEmployee.DepartmentId IS NULL;

  SELECT Name, Gender, Salary, DepartmentName
  FROM tblEmployee
  FULL JOIN tblDepartment
  ON tblEMployee.DepartmentId = tblDepartment.Id
  WHERE tblEmployee.DepartmentId IS NULL
  OR tblDepartment.Id IS NULL

  -- Don't use .....condition = NULL