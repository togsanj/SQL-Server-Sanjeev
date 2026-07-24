-- GROUP BY CLAUSE 

/*
In this session we will learn 
>Grouping rows using GROUP BY 
>Filtering Groups
>Differenece between WHERE and HAVING
*/

CREATE DATABASE Part11Sample;

USE [Part11Sample];
GO

/*
GROUP BY clause is used to group a selected set of rows
into summary rows by the values of one or more columns
or expressions.

It is always used with one or more aggregate functions.
*/


CREATE TABLE tblEmployee
(
ID INT PRIMARY KEY IDENTITY(1,1), 
Name NVARCHAR(50) NOT NULL,
Gender NVARCHAR(50) NOT NULL,
Salary INT NOT NULL,
City NVARCHAR(50) NOT NULL,
);

DROP TABLE tblEmployee;

ALTER TABLE tblEmployee
DROP COLUMN Email; 

ALTER TABLE tblEmployee 
ADD Gender NVARCHAR(20) NOT NULL;


INSERT INTO tblEmployee VALUES 
('Tom', 'Male',4000, 'London'),
('Pam', 'Female', 3000, 'New York'),
('John', 'Male', 3500, 'London'),
('Sam', 'Male', 4500, 'London'),
('Todd', 'Male', 2800, 'Sydney'),
('Ben', 'Male', 7000, 'New York'),
('Sara', 'Female', 4800, 'Sydney'),
('Valane', 'Female', 5500, 'New York'),
('James', 'Male', 6500, 'London'),
('Russel', 'Male', 8500, 'London')



SELECT * FROM tblEmployee;

SELECT SUM(Salary) FROM tblEmployee;

SELECT MIN(Salary) FROM tblEmployee;

SELECT MAX(Salary) FROM tblEmployee;

SELECT City, SUM(Salary) AS TotalSalary
FROM tblEmployee
GROUP BY City 

SELECT City, Gender, SUM(Salary) AS TotalSalary
FROM tblEmployee
GROUP BY City, Gender
ORDER BY City

SELECT Gender, City, SUM(Salary) AS TotalSalary
FROM tblEmployee 
GROUP BY Gender, City; 

/*
Filtering Groups:
           WHERE clause is used to filter rows before aggregation, WHERE AS HAVING clause is used to filter groups after aggregations. The following 2 queries produce the same result.

           SELECT City, SUM(Salary) AS TotalSalary
           FROM tblEmployee
           WHERE City = 'London'
           Group by City;

           SELECT City, SUM(Salary) AS TotalSalary
           FROM tblEMployee
           GROUP BY City
           HAVING City = 'London'


           Note: From a performance standpoint, you cannot say that one method is less efficient than the other. SQL Server optimizer analyses each statement and selects an efficient way of executing it. 
           AS a best practice, use the syntax that clearly describes the desired result. Try to eliminate rows that you wouldn't need, as early as possible.
           */

           SELECT Gender, City, SUM(Salary) AS TotalSalary, COUNT(ID) AS [Total Employees]
           FROM tblEmployee
           GROUP BY Gender, City;

           SELECT Gender, City, SUM(Salary) AS TotalSalary, COUNT(ID) AS [Total Employees]
           FROM tblEmployee
           WHERE Gender = 'Male' 
           GROUP BY Gender, City

           
           SELECT Gender, City, SUM(Salary) AS TotalSalary, COUNT(ID) AS TotalEmployees 
           FROM tblEmployee 
           WHERE Gender = 'Male'
           GROUP BY Gender, City
           HAVING Gender = 'Male' 
           

           SELECT Gender, City, SUM(Salary) AS TotalSalary, COUNT(ID) AS TotalEmployees
           FROM tblEmployee
           GROUP BY Gender, City
           HAVING Gender = 'Male'



          /* Difference - WHERE and HAVING clause

           1.WHERE clause can be used with - Select, Insert and Update statements, where as GAVING clause can only be used with the Select statement.

           2.WHERE clause filters rows before GROUP BY (aggregation), whereas HAVING clause filters groups after aggregation.

           3.Aggregate functions cannot be used in the WHERE clause, unless it is in a sub query contained in a HAVING clause, whereas, aggregate functions can be used in HAVING clause.

           */


           SELECT * FROM tblEmployee WHERE SUM(Salary) > 4000;

           SELECT Gender, City, SUM(Salary) AS TotalSalary, COUNT(ID) AS TotalEmployees
           FROM tblEmployee
           GROUP BY Gender, City
           HAVING SUM(Salary) > 5000;

   /*
           # Part 11 – GROUP BY Clause (Interview Questions)

## Basic Questions

1. What is the `GROUP BY` clause?
2. Why do we use the `GROUP BY` clause?
3. What is the purpose of the `GROUP BY` clause?
4. What is the syntax of the `GROUP BY` clause?
5. Can `GROUP BY` be used without an aggregate function?
6. Which aggregate functions are commonly used with `GROUP BY`?

## Aggregate Function Questions

7. What is an aggregate function?
8. What is the purpose of the `SUM()` function?
9. What is the purpose of the `COUNT()` function?
10. What is the purpose of the `MIN()` function?
11. What is the purpose of the `MAX()` function?
12. What is the purpose of the `AVG()` function?
13. What is the difference between `COUNT(*)` and `COUNT(ColumnName)`?

## GROUP BY Questions

14. Can we group data by multiple columns?
15. Why do we use multiple columns in the `GROUP BY` clause?
16. Can we use `ORDER BY` with `GROUP BY`?
17. Can we use column aliases with aggregate functions?
18. What happens if a selected column is not included in the `GROUP BY` clause or an aggregate function?

## HAVING Clause Questions

19. What is the `HAVING` clause?
20. Why do we use the `HAVING` clause?
21. What is the syntax of the `HAVING` clause?
22. Can aggregate functions be used in the `HAVING` clause?
23. Why can't aggregate functions be used directly in the `WHERE` clause?

## WHERE vs HAVING

24. What is the difference between the `WHERE` clause and the `HAVING` clause?
25. When should you use `WHERE` instead of `HAVING`?
26. When should you use `HAVING` instead of `WHERE`?
27. Which clause filters rows before aggregation?
28. Which clause filters groups after aggregation?
29. Can `WHERE` and `HAVING` be used together in the same query?
30. Can the `HAVING` clause be used without `GROUP BY`?

## Practical Questions

31. Write a query to find the total salary city-wise.
32. Write a query to find the total salary by City and Gender.
33. Write a query to count employees in each City.
34. Write a query to display only groups whose total salary is greater than 5000.
35. Write a query to display only Male employees grouped by City.

## Scenario-Based Questions

36. What happens if you use `SUM(Salary)` in the `WHERE` clause?
37. Why does the query `SELECT * FROM tblEmployee WHERE SUM(Salary) > 4000` produce an error?
38. How do you filter groups based on aggregate values?
39. Can `GROUP BY` improve the readability of summary reports?
40. Where is the `GROUP BY` clause used in real-world applications?

## Real-World Questions

41. Give a real-world example of the `GROUP BY` clause.
42. Where is the `HAVING` clause commonly used?
43. What are the advantages of using the `GROUP BY` clause?
44. What are the advantages of using the `HAVING` clause?
45. Explain a business scenario where both `WHERE` and `HAVING` are used together.

# ⭐ Most Important Questions (Freshers)

1. What is the `GROUP BY` clause?
2. Why do we use the `GROUP BY` clause?
3. What are aggregate functions? Name the most commonly used ones.
4. What is the `HAVING` clause?
5. What is the difference between `WHERE` and `HAVING`?
6. Can aggregate functions be used in the `WHERE` clause? Why?
7. Can `GROUP BY` be used with multiple columns?
8. Can `ORDER BY` be used with `GROUP BY`?
9. Write a query to display the total salary by City.
10. Write a query to display groups whose total salary is greater than 5000 using `HAVING`.
*/
