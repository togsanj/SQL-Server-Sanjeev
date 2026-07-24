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


 /*
 # Part 12 – SQL Server JOINS (Interview Questions)

## Basic Questions

1. What is a JOIN in SQL Server?
2. Why do we use JOINs?
3. What is the purpose of JOINs?
4. Can JOINs be used without a Foreign Key?
5. What are the different types of JOINs in SQL Server?
6. What is the general syntax of a JOIN?

## INNER JOIN Questions

7. What is an INNER JOIN?
8. Why do we use an INNER JOIN?
9. What does an INNER JOIN return?
10. Is `JOIN` the same as `INNER JOIN`?
11. What happens to non-matching rows in an INNER JOIN?

## LEFT JOIN Questions

12. What is a LEFT JOIN?
13. Why do we use a LEFT JOIN?
14. What does a LEFT JOIN return?
15. What is the difference between `LEFT JOIN` and `LEFT OUTER JOIN`?
16. Which table is considered the left table in a LEFT JOIN?

## RIGHT JOIN Questions

17. What is a RIGHT JOIN?
18. Why do we use a RIGHT JOIN?
19. What does a RIGHT JOIN return?
20. What is the difference between `RIGHT JOIN` and `RIGHT OUTER JOIN`?
21. Which table is considered the right table in a RIGHT JOIN?

## FULL JOIN Questions

22. What is a FULL JOIN?
23. Why do we use a FULL JOIN?
24. What does a FULL JOIN return?
25. What is the difference between `FULL JOIN` and `FULL OUTER JOIN`?
26. When should you use a FULL JOIN?

## CROSS JOIN Questions

27. What is a CROSS JOIN?
28. Why do we use a CROSS JOIN?
29. What is a Cartesian Product?
30. How many rows are returned by a CROSS JOIN?
31. Does a CROSS JOIN require an `ON` clause?
32. Why should CROSS JOIN be used carefully?

## Comparison Questions

33. What is the difference between INNER JOIN and LEFT JOIN?
34. What is the difference between LEFT JOIN and RIGHT JOIN?
35. What is the difference between INNER JOIN and FULL JOIN?
36. What is the difference between CROSS JOIN and INNER JOIN?
37. Which JOIN returns only matching rows?
38. Which JOIN returns all rows from the left table?
39. Which JOIN returns all rows from the right table?
40. Which JOIN returns all rows from both tables?

## Practical Questions

41. Write a query using an INNER JOIN.
42. Write a query using a LEFT JOIN.
43. Write a query using a RIGHT JOIN.
44. Write a query using a FULL JOIN.
45. Write a query using a CROSS JOIN.
46. Write the general syntax of a JOIN.

## Scenario-Based Questions

47. Can two tables be joined without a Foreign Key?
48. What happens if there are no matching rows in an INNER JOIN?
49. What happens if there are NULL values in the join column?
50. Which JOIN would you use to display all employees, including those without a department?
51. Which JOIN would you use to display all departments, including those with no employees?
52. Which JOIN would you use to display all employees and all departments, including unmatched records?
53. When should you use a CROSS JOIN in real-world applications?

## Real-World Questions

54. Where are JOINs used in real-world applications?
55. Give a real-world example of an INNER JOIN.
56. Give a real-world example of a LEFT JOIN.
57. Give a real-world example of a RIGHT JOIN.
58. Give a real-world example of a FULL JOIN.
59. Give a real-world example of a CROSS JOIN.

# ⭐ Most Important Questions (Freshers)

1. What is a JOIN in SQL Server?
2. Why do we use JOINs?
3. What are the different types of JOINs?
4. What is an INNER JOIN?
5. What is a LEFT JOIN?
6. What is a RIGHT JOIN?
7. What is a FULL JOIN?
8. What is a CROSS JOIN?
9. What is the difference between INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN, and CROSS JOIN?
10. Which JOIN would you use to display all employees, including those without a department?
*/