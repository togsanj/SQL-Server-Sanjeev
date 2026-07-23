-- JOINS
/*
In this session we will learn 
The different types of Joins in SQL Server
Cross Join
Inner Join
Outer Join - Left, Right and Full Outer Join

Pre-requisite:
Part 3 - Creating and Working with tables
Part 5 - Cascading referential integrity constraint

*/

/*
Joins in SQL Server are used to retreive data from 2 or more related tables. In general tables are related to each other using foreign key constraints.

In SQL Server, there are different types of JOINS
1.INNER JOIN
2.OUTER JOIN
3.CROSS JOIN

Outer Joins are again divided into 
1.Left Join or Left Outer Join
2.Right Join or Right Outer Join
3.Full Join or Full Outer Join

*/

  CREATE DATABASE Part12Sample;

  USE [Part12Sample];
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
  ID INT PRIMARY KEY,
  DepartmentName NVARCHAR(20) NOT NULL,
  London NVARCHAR(50) NOT NULL,
  DepartmentHead NVARCHAR(50) NOT NULL
  )

  ALTER TABLE tblDepartment 
  ALTER COLUMN Location NVARCHAR(50) NOT NULL;

  EXEC sp_rename  'tblDepartment.London', 'Location', 'COLUMN'; 

  ALTER TABLE tblEmployee
  ADD CONSTRAINT tblEmployee_DepartmentId_FK
  FOREIGN KEY (DepartmentId) REFERENCES tblDepartment(ID); 


  INSERT INTO tblEmployee VALUES 
  (1, 'Tom', 'Male',4000 ,1),
  (2, 'Pam', 'Female', 3000, 3),
  (3, 'John', 'Male', 3500, 1),
  (4, 'Sam', 'Male', 4500, 2),
  (5, 'Todd', 'Male', 2800, 2),
  (6, 'Ben', 'Male', 7000, 1),
  (7, 'Sara', 'Female', 4800, 3),
  (8, 'Valane', 'Female', 5500, 1),
  (9, 'James', 'Male', 6500,NULL),
  (10, 'Russel', 'Male', 8800, NULL)


  INSERT INTO tblDepartment VALUES 
  (1, 'IT', 'London', 'Rick'),
  (2, 'Payroll','Delhi' ,'Run'),
  (3, 'HR', 'New York', 'Christie'),
  (4, 'Other Department', 'Sydney','Cindrella')

  SELECT * FROM [tblEmployee]
  SELECT * FROM tblDepartment;
  /*
  INNER JOIN returns only the matching rows between both 
  the tables. Non matching rows are eliminated
  */

  SELECT Name, Gender, Salary, DepartmentName 
  FROM tblEmployee
  INNER JOIN  tblDepartment 
  ON tblEmployee.DepartmentId = tblDepartment.ID;

 -- OR

  SELECT Name, Gender, Salary, DepartmentName
  FROM tblEmployee 
  JOIN tblDepartment 
  ON tblEmployee.DepartmentId = tblDepartment.ID;

  /*
  INNER JOIN or JOIN
  Matching Rows only - Non matching rows eliminated
  */

  /*
  LEFT JOIN returns all the matching rows + non matching rows from the left table.

  */
  SELECT * FROM tblEmployee
  SELECT * FROM tblDepartment;

  SELECT Name, Gender, Salary, DepartmentName 
  FROM tblEmployee 
  LEFT OUTER JOIN tblDepartment 
  ON tblEmployee.DepartmentId = tblDepartment.Id;

  -- or

  SELECT Name, Gender, Salary, DepartmentName 
  FROM tblEmployee 
  LEFT JOIN tblDepartment 
  ON tblEmployee.DepartmentId = tblDepartment.Id;

  /*
 LEFT OUTER JOIN or LEFT JOIN
 Matching Rows + Non matching rows from the left table.
 */

 /*
 RIGHT OUTER JOIN or RIGHT JOIN
 RIGHT JOIN returns all the matching rows + non matching rows from the right table
 */

 SELECT Name, Gender, Salary, DepartmentName 
 FROM tblEmployee
 RIGHT OUTER JOIN tblDepartment
 ON tblEmployee.DepartmentId = tblDepartment.Id;

 -- or

 SELECT Name, Gender, Salary, DepartmentName
 FROM tblEmployee
 RIGHT JOIN tblDepartment 
 ON tblEmployee.DepartmentId = tblDepartment.Id;

 /*
 RIGHT OUTER JOIN or RIGHT JOIN 
 Matching Rows + Non matching rows from the right table */
 */

 /*
 FULL OUTER JOIN or FULL JOIN
 FULL JOIN returns all rows from both the left and right tables, including the non matching rows.
 */

 SELECT Name, Gender, Salary, DepartmentName 
 FROM tblEmployee
 FULL OUTER JOIN tblDepartment
 ON tblEmployee.DepartmentId = tblDepartment.Id;

-- or

 SELECT Name, Gender, Salary, DepartmentName
 FROM tblEmployee
 FULL JOIN tblDepartment
 ON tblEmployee.DepartmentId = tblDepartment.Id;

 /*
 FULL OUTER JOIN or FULL JOIN
 Matching Rows + Non matching rows from both the tables. 
 */

 /*
 CROSS JOIN, produces the Cartesian product of the 2 tables involved in the join. For example, in the Employee table we have 10 rows and in the Departments table we have 4 rows. So, a cross join between these 2 tables produces 40 rows.

 
 NOTE: Cross Join shouldn't have ON clause.

 */

 General Formula for Joins
 SELECT         COLUMN_LIST
 FROM           LEFT_TABLE_NAME
 JOIN_TYPE      RIGHT_TABLE_NAME
 ON             JOIN_CONDITIONS

 -- CROSS JOIN:
 SELECT Name, Gender, Salary, DepartmentName
 FROM tblEmployee
 CROSS JOIN tblDepartment


 /*
 Summary 
 Join Type | Purpose 
 Cross Join| Returns cartesian product of thhe tables involved in the join
 Inner Join | Returns only the matching rows. Non matching rows are eliminated.
 Left Join | Returns all the matching rows + non matching rows from the left table.
 Right Join | Returns all the matching rows + non matching rows from the right table.
 Full Join | Returns all rows from both tables, including the non matching rows.

 */