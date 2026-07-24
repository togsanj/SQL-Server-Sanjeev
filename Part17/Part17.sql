-- UNION and UNION ALL

/*
In this session we will learn
Purpose of UNION and UNION ALL
Difference between UNION and UNION ALL
Difference between JOIN and UNION


UNION and UNION ALL operators in SQL Server, are used to combine the result-set of two or more SELECT queries.


*/

CREATE DATABASE Part17Sample;

USE [Part17Sample];
GO

EXEC sp_rename 'tblInidaCustomers', 'tblIndiaCustomers';

CREATE TABLE tblIndiaCustomers
(Id INT PRIMARY KEY,
Name NVARCHAR(50) NOT NULL,
Email NVARCHAR(50) NOT NULL
)

CREATE TABLE tblUKCustomers
(
Id INT PRIMARY KEY,
Name NVARCHAR(50) NOT NULL,
Email NVARCHAR(50) NOT NULL
);

INSERT INTO tblIndiaCustomers (Id, Name, Email) VALUES 
(1, 'Rai', 'R@R.com'),
(2, 'Sam', 'S@S.com')

INSERT INTO tblUKCustomers (Id, Name, Email) VALUES 
(1, 'Ben', 'B@B.com'),
(2, 'Sam', 'S@S.com')

CREATE TABLE tblUSCustomers
(
ID INT PRIMARY KEY,
Name NVARCHAR(50) NOT NULL,
Email NVARCHAR(50) NOT NULL
);

INSERT INTO tblUSCustomers (Id, Name, Email) VALUES 
(1, 'John', 'J@J.com'),
(2, 'Todd', 'T@T.com')


SELECT * FROM tblIndiaCustomers
 UNION ALL
SELECT * FROM tblUKCustomers
UNION ALL
SELECT * FROM tblUSCustomers
ORDER BY Name


-- UNION
SELECT Id, Name, Email FROM tblIndiaCustomers
UNION
SELECT Id, Name, Email FROM tblUKCustomers


-- UNION ALL
SELECT Id, Name, Email FROM tblIndiaCustomers
UNION ALL
SELECT Id, Name, Email FROM tblUKCustomers

/*
Note: For UNION and UNION ALL to work, the Number, Data types, and the border of the columns in the select statements should be same.

UNION & UNION ALL & JOINS

Different between UNION and UNION ALL
1. UNION removes duplicate rows, where as UNION ALL does not.
2. UNION has to perform distinct sort to remove duplicates, which makes it less faster than UNION ALL

Note: Estimated query execution plan - CTRL + L

Sorting results of a UNION or UNION ALL
ORDER BY clause should be used only on the last SELECT statement in the UNION query

Difference between UNION and JOIN
UNION combines the result-set of two or more select queries into a single result-set which includes all the rows from all the queries in the union, where as JOINS, retrieve data from two or more tables based on logical relationship between the tables.

In short, UNION combines rows from 2 or more tables, where JOINS combine columns from 2 or more table.
*/

/*
# Part 17 – UNION and UNION ALL (Interview Questions)

## Basic Questions

1. What is the `UNION` operator in SQL Server?
2. Why do we use the `UNION` operator?
3. What is the `UNION ALL` operator?
4. Why do we use the `UNION ALL` operator?
5. What is the purpose of `UNION` and `UNION ALL`?

## Concept Questions

6. What is the difference between `UNION` and `UNION ALL`?
7. Does `UNION` remove duplicate rows?
8. Does `UNION ALL` remove duplicate rows?
9. Why is `UNION ALL` faster than `UNION`?
10. Why does `UNION` take more time than `UNION ALL`?
11. What is the role of the `DISTINCT` sort in a `UNION` query?

## Rules of UNION Questions

12. What conditions must be satisfied for `UNION` and `UNION ALL` to work?
13. Why must both `SELECT` statements return the same number of columns?
14. Why should the corresponding columns have compatible data types?
15. Why should the order of columns be the same in all `SELECT` statements?
16. Can the column names be different in `UNION` queries?

## ORDER BY Questions

17. Where should the `ORDER BY` clause be written in a `UNION` query?
18. Why should `ORDER BY` be used only in the last `SELECT` statement?
19. What happens if `ORDER BY` is written before the last `SELECT` statement?

## Comparison Questions

20. What is the difference between `UNION` and `UNION ALL`?
21. What is the difference between `UNION` and `JOIN`?
22. Does `UNION` combine rows or columns?
23. Does `JOIN` combine rows or columns?
24. When should you use `UNION` instead of `JOIN`?
25. When should you use `JOIN` instead of `UNION`?

## Practical Questions

26. Write a query using `UNION`.
27. Write a query using `UNION ALL`.
28. Write a query to combine data from three tables using `UNION ALL`.
29. Write a `UNION` query and sort the result by `Name`.
30. What will happen if the number of columns is different in a `UNION` query?

## Scenario-Based Questions

31. What happens if duplicate rows exist when using `UNION`?
32. What happens if duplicate rows exist when using `UNION ALL`?
33. What happens if the data types of corresponding columns are incompatible?
34. Which operator should you use for better performance when duplicate rows are acceptable?
35. Where are `UNION` and `UNION ALL` used in real-world applications?

## Real-World Questions

36. Give a real-world example of the `UNION` operator.
37. Give a real-world example of the `UNION ALL` operator.
38. What are the advantages of `UNION`?
39. What are the advantages of `UNION ALL`?
40. Explain a business scenario where `UNION` is preferred over `UNION ALL`.

# ⭐ Most Important Questions (Freshers)

1. What is the `UNION` operator?
2. What is the `UNION ALL` operator?
3. What is the difference between `UNION` and `UNION ALL`?
4. Why is `UNION ALL` faster than `UNION`?
5. What conditions must be satisfied for `UNION` and `UNION ALL` to work?
6. Where should the `ORDER BY` clause be used in a `UNION` query?
7. What is the difference between `UNION` and `JOIN`?
8. Does `UNION` combine rows or columns?
9. Write a query using `UNION`.
10. Write a query using `UNION ALL`.
*/