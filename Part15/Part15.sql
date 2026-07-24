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


/*
# Part 15 – Different Ways to Replace NULL Values (Interview Questions)

## Basic Questions

1. What is `NULL` in SQL Server?
2. Why do we replace `NULL` values?
3. What are the different ways to replace `NULL` values in SQL Server?
4. What is the difference between `NULL` and an empty string (`''`)?
5. Which methods are commonly used to replace `NULL` values?

## ISNULL() Questions

6. What is the `ISNULL()` function?
7. Why do we use the `ISNULL()` function?
8. What is the syntax of the `ISNULL()` function?
9. What does `ISNULL(NULL, 'No Manager')` return?
10. What happens if the first argument of `ISNULL()` is not `NULL`?
11. Can `ISNULL()` be used with numeric values?
12. Can `ISNULL()` be used inside a `SELECT` statement?

## CASE Statement Questions

13. What is the `CASE` statement?
14. Why do we use the `CASE` statement?
15. How do you replace `NULL` values using a `CASE` statement?
16. When should you use a `CASE` statement instead of `ISNULL()`?
17. Can a `CASE` statement handle multiple conditions?

## COALESCE() Questions

18. What is the `COALESCE()` function?
19. Why do we use the `COALESCE()` function?
20. What is the syntax of the `COALESCE()` function?
21. What does `COALESCE(NULL, 'No Manager')` return?
22. What happens if the first value passed to `COALESCE()` is not `NULL`?
23. Can `COALESCE()` accept more than two arguments?

## Comparison Questions

24. What is the difference between `ISNULL()` and `COALESCE()`?
25. What is the difference between `ISNULL()` and a `CASE` statement?
26. What is the difference between `COALESCE()` and a `CASE` statement?
27. Which is better for replacing a single `NULL` value: `ISNULL()` or `COALESCE()`?
28. Which method is more flexible: `ISNULL()`, `CASE`, or `COALESCE()`?

## Practical Questions

29. Write a query using `ISNULL()` to replace `NULL` with `'No Manager'`.
30. Write a query using a `CASE` statement to replace `NULL` with `'No Manager'`.
31. Write a query using `COALESCE()` to replace `NULL` with `'No Manager'`.
32. Write a query to display Employee Name and Manager Name, replacing `NULL` with `'No Manager'`.

## Scenario-Based Questions

33. What happens if the manager name is `NULL` in the Employee–Manager table?
34. Which method would you use to display `'No Manager'` instead of `NULL`?
35. Can `ISNULL()` and `COALESCE()` be used with any data type?
36. Where are `NULL` replacement functions used in real-world applications?

## Real-World Questions

37. Give a real-world example of replacing `NULL` values.
38. What are the advantages of using `ISNULL()`?
39. What are the advantages of using `COALESCE()`?
40. When is a `CASE` statement preferred over `ISNULL()` and `COALESCE()`?

# ⭐ Most Important Questions (Freshers)

1. What is `NULL` in SQL Server?
2. Why do we replace `NULL` values?
3. What are the different ways to replace `NULL` values in SQL Server?
4. What is the `ISNULL()` function?
5. What is the `CASE` statement?
6. What is the `COALESCE()` function?
7. What is the difference between `ISNULL()`, `CASE`, and `COALESCE()`?
8. Which function can accept multiple arguments: `ISNULL()` or `COALESCE()`?
9. Write a query to replace `NULL` with `'No Manager'` using `ISNULL()`.
10. Write a query to replace `NULL` with `'No Manager'` using `COALESCE()`.

*/