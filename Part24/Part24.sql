-- String functions Continued
/*
In this session we will learn 

Few more commonly used built-in string functions in SQL server
  Replicate
  Space
  Patindex
  Replace
  Stuff

  Pre-requisite:
  Part 22 - Built in string functions in sql server
  Part 23 - String functions continued

  
  */

  CREATE DATABASE Part24Sample;

  USE Part24Sample;
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
(10, 'Pam', 'Broker', 'Pam@bbb.com');

SELECT * FROM tblEmployee;


  --REPLICATE() FUNCTION 
 /* REPLICATE(String_To_Be_Replicated, Number_Of_Times_To_Replicate)
    Repeats the given string, for the specified number of times.

  Mask the email with 5*(star)symbols
  */
  SELECT REPLICATE('Sanjeev', 3)

 SELECT FirstName, LastName,
         SUBSTRING(Email, 1, 2) + REPLICATE('*', 5) +
         SUBSTRING(Email, CHARINDEX('@', Email), LEN(Email) - CHARINDEX('@', Email) +1) AS Email
  FROM tblEmployee;

         -- SPACE FUNCTION
        /* SPACE(Number_Of_Spaces)
         Returns number of spaces, specified by the Number_Of_Spaces argument.
         */
         SELECT '     '

         SELECT Space (5)

        -- The SPACES(5), inserts 5 spaces between FirstName and LastName

  SELECT FirstName + SPACE(5) + LastName AS FullName
  FROM tblEmployee

  --PATINDEX Function
 /* PATINDEX('%Pattern', Expression)
  Returns the starting position of the first occurrence of a pattern in a specified expression. It takes two arguments, the pattern to be searched and the expression. PATINDEX() is similar to CHARINDEX(). With CHARINDEX() we cannot use wildcards, whereas PATINDEX() provides this capability. If the specified pattern is not found, PATINDEX() returns ZERO.
  */
  SELECT Email, PATINDEX('%@aaa.com', Email) AS FirstOccurrence 
  FROM tblEmployee
  WHERE PATINDEX('%@aaa.com', Email) > 0

  -- REPLACE Function
/*
  REPLACE(String_Expression, Pattern, Replacement_Value)
  Replaces all occurrences of a specified string value with another string value.

  All .COM strings are replaced with .NET
  */
  SELECT Email, REPLACE(Email, '.com', '.net') AS ConvertedEmail
  FROM tblEmployee

  -- STUFF Function
 /* STUFF(Original_Expression, Start, Length, Replacement_expression)
  STUFF() function inserts Replacement_expression, at the start position specified, along with 
  removing the characters specified using Length parameter.
  */
  SELECT FirstName, LastName, Email,
     STUFF(Email, 2, 3, '*****') AS stuffedEmail
     FROM tblEmployee

     /*
     ## Part 24 – SQL Server Interview Questions

1. What is the REPLICATE() function in SQL Server?
2. What is the syntax of the REPLICATE() function?
3. What are the common use cases of the REPLICATE() function?
4. How can you mask sensitive data (such as email addresses) using REPLICATE()?
5. What does the SPACE() function do?
6. What is the syntax of the SPACE() function?
7. How do you insert multiple spaces between two strings using SPACE()?
8. What is the PATINDEX() function in SQL Server?
9. What is the syntax of the PATINDEX() function?
10. What is the difference between PATINDEX() and CHARINDEX()?
11. Can PATINDEX() use wildcard characters? Which wildcards are supported?
12. What value does PATINDEX() return if the specified pattern is not found?
13. What is the REPLACE() function in SQL Server?
14. What is the syntax of the REPLACE() function?
15. Does the REPLACE() function replace only the first occurrence or all occurrences of a string?
16. How can you replace one domain extension (for example, .com) with another (such as .net) using REPLACE()?
17. What is the STUFF() function in SQL Server?
18. What is the syntax of the STUFF() function?
19. How does the STUFF() function work with the Start and Length parameters?
20. What happens if the Start position is greater than the length of the string in the STUFF() function?
21. Can the STUFF() function be used to insert text without removing characters?
22. What is the difference between REPLACE() and STUFF()?
23. Which string function would you use to partially mask an email address: REPLICATE() or STUFF()? Explain your answer.
24. Which function is better for searching a string using wildcard patterns: CHARINDEX() or PATINDEX()?
25. Which string functions from Part 24 are commonly used in real-world applications such as data masking, data formatting, and text manipulation?

*/