-- String functions Continued
/*
 In this session we will learn
 Few more commonly used built-in string functions in SQL server
    LEFT()
    RIGHT()
    CHARINDEX()
    SUBSTRING()

    A real time example of using string functions

    Pre-requisite:
    Part 11 - Group By in SQL Server
    Part 22 - Built in string functions in sql server
    
    Function                                                                    |    Purpose

  LEFT(Character_Expression, Integer_Expression)                                |Return the specified number of characters from the left hand side of the given character expression

  RIGHT(Character_Expression, Integer_Expression)                               |Returns the specifiednumber of characters from the right hand side of the given character expression.

  CHARINDEX('Expression_To_Find', 'Expression_To_Search', 'Start_Location')     |  Returns the starting position of the specified expression in a character string

  SUBSTRING('Expression', 'Start', 'Length')                                    |Returns substring(part of the string), from the given expression

  */

  SELECT SUBSTRING(Email, CHARINDEX('@', Email) +1,
  (LEN(Email) - CHARINDEX('@', Email))) AS EmailDomain,
  COUNT(*) AS Total
  FROM tblEmployee
  Group By SUBSTRING(Email, CHARINDEX('@', Email) +1,
  (LEN(Email) - CHARINDEX('@', Email))) 


CREATE DATABASE Part23Sample;

USE Part23Sample;
GO

CREATE TABLE tblEmployee
(
Id INT PRIMARY KEY,
FirstName NVARCHAR(50) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
Email NVARCHAR(50) NOT NULL
);

INSERT INTO tblEmployee (Id, FirstName, LastName, Email) VALUES 
(1, 'Sam', 'Sony', 'Sam@aaa.com'),
(2, 'Ram', 'Barbar', 'Ram@aaa.com'),
(3, 'Sara', 'Sanosky', 'Sara@ccc.com'),
(4, 'Todd', 'Gartner', 'Todd@bbb.com'),
(5, 'John', 'Grover', 'John@aaa.com'),
(6, 'Sana', 'Lenin', 'Sana@ccc.com'),
(7, 'James', 'Bond', 'James@bbb.com'),
(8, 'Rob', 'Hunter', 'Rob@ccc.com'),
(9, 'Steve', 'Wilson', 'Steve@aaa.com'),
(10, 'Pam', 'Broker', 'Pam@bbb.com')

SELECT * FROM tblEmployee;

SELECT LEFT('ABCDEF', 4)

SELECT RIGHT('ABCDEF', 3)

SELECT CHARINDEX('@', 'sara@aaa.com')

SELECT SUBSTRING('sara@aaa.com', 6,7)

SELECT SUBSTRING('pam@bbb.com', CHARINDEX('@', 'pam@bbb.com'), 7)

SELECT SUBSTRING('pam@bbb.com', CHARINDEX('@', 'pam@bbb.com') +1, 7)

SELECT SUBSTRING('pam@bbb.com', CHARINDEX('@', 'pam@bbb.com') + 1, 
LEN('pam@bbb.com') - CHARINDEX('@', 'pam@bbb.com'))

SELECT SUBSTRING(Email, CHARINDEX('@', Email) + 1, 
LEN(Email) - CHARINDEX('@', Email))
FROM tblEmployee;


SELECT SUBSTRING(Email, CHARINDEX('@', Email) + 1,
LEN(Email) - CHARINDEX('@', Email)) AS EmailDomain,
COUNT(Email) AS Total
FROM tblEmployee
GROUP BY SUBSTRING(Email, CHARINDEX('@', Email) +1,
LEN(Email) - CHARINDEX('@', Email))

/*
## String Functions Continued Interview Questions

1. What is the purpose of the `LEFT()` function in SQL Server?
2. What is the purpose of the `RIGHT()` function in SQL Server?
3. What is the purpose of the `CHARINDEX()` function?
4. What is the purpose of the `SUBSTRING()` function?
5. What is the syntax of the `LEFT()` function?
6. What is the syntax of the `RIGHT()` function?
7. What is the syntax of the `CHARINDEX()` function?
8. What is the syntax of the `SUBSTRING()` function?
9. What does the third parameter of the `CHARINDEX()` function represent?
10. What value does `CHARINDEX()` return if the specified expression is not found?
11. What is the difference between `LEFT()` and `RIGHT()`?
12. How do you extract the first N characters from a string?
13. How do you extract the last N characters from a string?
14. How do you find the position of a specific character in a string?
15. How do you extract a specific part of a string using `SUBSTRING()`?
16. How do you extract the domain name from an email address?
17. Why is `CHARINDEX()` often used with `SUBSTRING()`?
18. How do you group records based on the email domain?
19. Write a query to display the first 4 characters of a string.
20. Write a query to display the last 3 characters of a string.
21. Write a query to find the position of `'@'` in an email address.
22. Write a query to extract the domain name from an email address.
23. Write a query to count the number of employees for each email domain.
24. Write a query to extract everything after a specific character in a string.
25. Write a query to extract everything before a specific character in a string.

*/