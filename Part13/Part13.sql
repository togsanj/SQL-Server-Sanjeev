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

  /*
  # Part 13 – Advanced JOINS (Interview Questions)

## Basic Questions

1. What are Advanced (Intelligent) JOINs in SQL Server?
2. Why do we use Advanced JOINs?
3. What is the purpose of Advanced JOINs?
4. Which JOINs are commonly used to find non-matching records?
5. Why do we use `IS NULL` in Advanced JOINs?

## Left Non-Matching Rows

6. How do you retrieve only the non-matching rows from the left table?
7. Which JOIN is used to find records that exist only in the left table?
8. Why do we use `LEFT JOIN` with `WHERE RightTable.Column IS NULL`?
9. What does the following query return?

   ```sql
   LEFT JOIN ... WHERE RightTable.Id IS NULL
   ```
10. Give a real-world example of finding non-matching rows from the left table.

## Right Non-Matching Rows

11. How do you retrieve only the non-matching rows from the right table?
12. Which JOIN is used to find records that exist only in the right table?
13. Why do we use `RIGHT JOIN` with `WHERE LeftTable.Column IS NULL`?
14. What does the following query return?

```sql
RIGHT JOIN ... WHERE LeftTable.Id IS NULL
```

15. Give a real-world example of finding non-matching rows from the right table.

## Full Non-Matching Rows

16. How do you retrieve only the non-matching rows from both tables?
17. Which JOIN is used to find unmatched records from both tables?
18. Why do we use a `FULL JOIN` with `IS NULL` conditions?
19. What does the following query return?

```sql
FULL JOIN ...
WHERE LeftTable.Id IS NULL
   OR RightTable.Id IS NULL
```

20. Give a real-world example of finding non-matching rows from both tables.

## NULL Questions

21. Why should we use `IS NULL` instead of `= NULL`?
22. Why does `Column = NULL` not work in SQL Server?
23. What is the correct way to check for NULL values?
24. What is the difference between `IS NULL` and `= NULL`?
25. Can `IS NOT NULL` also be used with JOINs?

## Comparison Questions

26. What is the difference between a normal LEFT JOIN and a LEFT JOIN with `IS NULL`?
27. What is the difference between a LEFT JOIN and a RIGHT JOIN for finding non-matching rows?
28. What is the difference between a FULL JOIN and a FULL JOIN with `IS NULL`?
29. What is the difference between matching rows and non-matching rows?
30. Which JOIN should you use to find orphan records?

## Practical Questions

31. Write a query to display employees without a department.
32. Write a query to display departments without employees.
33. Write a query to display all unmatched records from both tables.
34. Write a query using `LEFT JOIN` and `IS NULL`.
35. Write a query using `RIGHT JOIN` and `IS NULL`.
36. Write a query using `FULL JOIN` and `IS NULL`.

## Scenario-Based Questions

37. How do you find employees who are not assigned to any department?
38. How do you find departments that have no employees?
39. How do you find orphan records in a database?
40. Where are Advanced JOINs used in real-world applications?

## Real-World Questions

41. Give a real-world example of a LEFT JOIN with `IS NULL`.
42. Give a real-world example of a RIGHT JOIN with `IS NULL`.
43. Give a real-world example of a FULL JOIN with `IS NULL`.
44. What are the advantages of Advanced JOINs?
45. Why are Advanced JOINs commonly asked in SQL interviews?

# ⭐ Most Important Questions (Freshers)

1. What are Advanced (Intelligent) JOINs?
2. How do you retrieve only the non-matching rows from the left table?
3. How do you retrieve only the non-matching rows from the right table?
4. How do you retrieve only the non-matching rows from both tables?
5. Why do we use `IS NULL` in Advanced JOINs?
6. Why does `= NULL` not work in SQL Server?
7. What is the difference between a normal LEFT JOIN and a LEFT JOIN with `IS NULL`?
8. Which JOIN is used to find orphan records?
9. Write a query to find employees without a department.
10. Write a query to find departments without employees.
*/
