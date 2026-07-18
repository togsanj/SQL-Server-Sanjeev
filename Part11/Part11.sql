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

