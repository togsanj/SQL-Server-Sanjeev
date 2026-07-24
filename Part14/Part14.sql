-- SELF JOIN

CREATE DATABASE Part14Sample;

USE Part14Sample;
GO

/*
In this session we will learn 

1.Joining a table with iTself - Self Join
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
  ON        E.ManagerId = M.EmployeeId;

  -- RIGHT OUTER SELF JOIN
  SELECT E.Name AS Employee, M.Name AS Manager
  FROM   tblEmployee E
  RIGHT JOIN tblEmployee M
  ON      E.ManagerId = M.EmployeeId;

  -- INNER SELF JOIN
  SELECT E.Name AS Employee, M.Name AS Manager
  FROM tblEmployee E
  INNER JOIN tblEmployee M
  ON      E.ManagerId = M.EmployeeID;
  
  SELECT * FROM tblEmployee;

  -- FULL OUTER SELF JOIN 
  SELECT E.Name AS Employee, M.Name AS Manager
  FROM tblEmployee E
  FULL JOIN tblEmployee M
  ON E.ManagerId = M.EmployeeId;

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

 /*
 # Part 14 – SELF JOIN (Interview Questions)

## Basic Questions

1. What is a SELF JOIN?
2. Why do we use a SELF JOIN?
3. What is the purpose of a SELF JOIN?
4. Is SELF JOIN a separate type of JOIN?
5. Can a table be joined with itself?
6. Why do we use table aliases (`E`, `M`) in a SELF JOIN?

## Concept Questions

7. How does a SELF JOIN work?
8. What is the role of aliases in a SELF JOIN?
9. What happens if aliases are not used in a SELF JOIN?
10. Which column is commonly used to relate rows in a SELF JOIN?
11. Can a SELF JOIN be performed without a Foreign Key?
12. What kind of relationships are represented using a SELF JOIN?

## Types of SELF JOIN

13. What is an INNER SELF JOIN?
14. What is a LEFT SELF JOIN?
15. What is a RIGHT SELF JOIN?
16. What is a FULL SELF JOIN?
17. What is a CROSS SELF JOIN?
18. Is a SELF JOIN limited to only INNER JOIN?

## Comparison Questions

19. What is the difference between a normal JOIN and a SELF JOIN?
20. What is the difference between an INNER SELF JOIN and a LEFT SELF JOIN?
21. What is the difference between a LEFT SELF JOIN and a RIGHT SELF JOIN?
22. What is the difference between a FULL SELF JOIN and a CROSS SELF JOIN?
23. Why is a CROSS SELF JOIN rarely used?

## Practical Questions

24. Write a query to display Employee Name and Manager Name using a SELF JOIN.
25. Write a query using an INNER SELF JOIN.
26. Write a query using a LEFT SELF JOIN.
27. Write a query using a RIGHT SELF JOIN.
28. Write a query using a FULL SELF JOIN.
29. Write a query using a CROSS SELF JOIN.

## Scenario-Based Questions

30. Why is a LEFT SELF JOIN preferred in an Employee–Manager relationship?
31. Why does the CEO/Top Manager show `NULL` in the Manager column?
32. What happens if an employee has no manager?
33. Can an employee be his own manager?
34. Can multiple employees have the same manager?
35. Where are SELF JOINs used in real-world applications?

## Real-World Questions

36. Give a real-world example of a SELF JOIN.
37. Where is a SELF JOIN commonly used?
38. What are the advantages of using a SELF JOIN?
39. What are the limitations of a SELF JOIN?
40. Explain the Employee–Manager hierarchy using a SELF JOIN.

# ⭐ Most Important Questions (Freshers)

1. What is a SELF JOIN?
2. Why do we use a SELF JOIN?
3. Is SELF JOIN a separate type of JOIN?
4. Why are table aliases required in a SELF JOIN?
5. What is the difference between a normal JOIN and a SELF JOIN?
6. Can a SELF JOIN be an INNER, LEFT, RIGHT, FULL, or CROSS JOIN?
7. Write a query to display Employee Name and Manager Name using a SELF JOIN.
8. Why does the top-level manager (CEO) have a `NULL` ManagerId?
9. Where are SELF JOINs used in real-world applications?
10. Explain the Employee–Manager hierarchy using a SELF JOIN.

*/


