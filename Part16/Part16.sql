-- COALESCE() function in SQL Server

/*
In this session we will learn
COALESCE() function with an example

COALESCE() Function - Returns the first NON NULL value
*/

CREATE DATABASE Part16Sample;

USE Part16Sample;
GO

CREATE TABLE tblEmployee 
(
Id INT PRIMARY KEY,
FirstName NVARCHAR(50),
MiddleName NVARCHAR(50),
LastName NVARCHAR(50)
);

INSERT INTO tblEmployee (Id, FirstName, MiddleName, LastName) VALUES 
(1, 'Sam', NULL, NULL),
(2, NULL, 'Todd', 'Tanzan'),
(3, NULL, NULL, 'Sara'),
(4, 'Ben', 'Paker', NULL),
(5, 'James', 'Nick', 'Nancy');


SELECT * FROM tblEmployee;

SELECT 
Id, 
COALESCE(FirstName, MiddleName, LastName) AS Name
FROM tblEmployee;


/*
# Part 16 – COALESCE() Function (Interview Questions)

## Basic Questions

1. What is the `COALESCE()` function in SQL Server?
2. Why do we use the `COALESCE()` function?
3. What is the purpose of the `COALESCE()` function?
4. What is the syntax of the `COALESCE()` function?
5. What does the `COALESCE()` function return?

## Concept Questions

6. How does the `COALESCE()` function work?
7. What happens if the first value is `NULL`?
8. What happens if the first value is not `NULL`?
9. What happens if all values passed to `COALESCE()` are `NULL`?
10. Can `COALESCE()` accept more than two arguments?
11. Can `COALESCE()` be used with different data types?
12. Can `COALESCE()` be used in a `SELECT` statement?

## Practical Questions

13. Write the syntax of the `COALESCE()` function.
14. Write a query to display the first non-NULL value from `FirstName`, `MiddleName`, and `LastName`.
15. Write a query using `COALESCE()` to display Employee Name.
16. What will be the output of:

    ```sql
    SELECT COALESCE(NULL, 'SQL', 'Server');
    ```
17. What will be the output of:

    ```sql
    SELECT COALESCE(NULL, NULL, 'SQL');
    ```
18. What will be the output of:

    ```sql
    SELECT COALESCE(NULL, NULL, NULL);
    ```

## Comparison Questions

19. What is the difference between `ISNULL()` and `COALESCE()`?
20. What is the difference between `COALESCE()` and a `CASE` statement?
21. Why is `COALESCE()` more flexible than `ISNULL()`?
22. Which function returns the first non-NULL value?
23. Which function accepts multiple arguments: `ISNULL()` or `COALESCE()`?

## Scenario-Based Questions

24. When should you use `COALESCE()` instead of `ISNULL()`?
25. Where is the `COALESCE()` function used in real-world applications?
26. Why is `COALESCE()` useful when multiple columns may contain `NULL` values?
27. How would you display a person's name if `FirstName` is `NULL`, then `MiddleName`, otherwise `LastName`?

## Real-World Questions

28. Give a real-world example of the `COALESCE()` function.
29. What are the advantages of using `COALESCE()`?
30. What are the limitations of the `COALESCE()` function?

# ⭐ Most Important Questions (Freshers)

1. What is the `COALESCE()` function?
2. Why do we use the `COALESCE()` function?
3. What does the `COALESCE()` function return?
4. What happens if all values passed to `COALESCE()` are `NULL`?
5. Can `COALESCE()` accept multiple arguments?
6. What is the difference between `ISNULL()` and `COALESCE()`?
7. Why is `COALESCE()` more flexible than `ISNULL()`?
8. Write a query using `COALESCE()` to display the first non-NULL value.
9. Write a query to display Employee Name using `COALESCE(FirstName, MiddleName, LastName)`.
10. Where is the `COALESCE()` function used in real-world applications?
*/