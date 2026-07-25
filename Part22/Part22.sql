-- String functions
/*
In this session we will learn 
Commonly used built-in string functions in SQL server

Function                            |        Purpose
ASCII(Character_Expression)         |Returns the ASCII code of the given character expression.

CHAR(Integer_Expression)            |Converts an int ASCII code to a character. The Integer_Expression, should be between 0 and 255.

LTRIM(Character_Expression)         |Removes blanks on the left handside of the given character expression.

RTRIM(Character_Expression)         |Removes blanks on the right hand side of the given character expression

LOWER(Character_Expression)         |Converts all the characters in the given Character_Expression, to lowercase letters.

UPPER(Character_Expression)         |Converts all the characters in the gievn Character_Expression, to uppercase letters.

REVERSE('Any_String_Expression')    |Reverses all the characters in the given string expression.

LEN(String_Expression)              |Returns the count of total characters, in the given string expression,
                                           excluding the blanks at the end of the expression.
                                    
*/

    -- In the next video session-Rest of the commonly used built-in string functions  
    
    
    CREATE DATABASE Part22Sample;

    USE Part22Sample;
    GO

    SELECT ASCII('A')

    SELECT ASCII('ABC')

    SELECT ASCII('BC')

    SELECT ASCII('a')

    SELECT ASCII('0')

    SELECT CHAR(65) 

    Declare @Start INT
    SET @Start = 65
    WHILE(@Start <= 90)
    BEGIN
      Print CHAR(@Start)
      SET @Start = @Start + 1
    END

    Declare @Start INT
    SET @Start = 97
    WHILE(@Start <= 122)
    BEGIN
      Print CHAR(@Start)
      SET @Start = @Start + 1
    END

    Declare @Start INT
    SET @Start = 48
    WHILE(@Start <= 57)
    BEGIN
      PRINT CHAR(@Start)
      SET @Start = @Start + 1
   END 

   SELECT '   Hello' 

   SELECT LTRIM('  Hello')

   DROP TABLE tblEmployee;

   CREATE TABLE tblEmployee
   (
   Id INT PRIMARY KEY,
   FirstName NVARCHAR(50) NOT NULL,
   MiddleName NVARCHAR(50) ,
   LastName NVARCHAR(50) NOT NULL,
   Email NVARCHAR(50) NOT NULL,
   Gender NVARCHAR(50) NOT NULL,
   DepartmentId INT NOT NULL,
   Number INT NOT NULL
   );





   SELECT * FROM tblEmployee;

   INSERT INTO tblEmployee (Id, FirstName, MiddleName, LastName, Email, Gender, DepartmentId, Number) VALUES 
   (1, 'Sam', 'S', 'Sony', 'Sam@aaa.com', 'Male', 1,1),
   (2, '   Ram', 'R', 'Barber','Ram@aaa.com', 'Male', 1,2),
   (3, '    Sara', ' ', 'Sanosky', 'Sara@ccc.com', 'Female', 3,2),
   (4, 'Todd', ' ', 'Gartner', 'Todd@bbb.com', 'Male', 2,2),
   (5, 'John', 'J', 'Grover', 'John@aaa.com', 'Male',3 ,1 ),
   (6, 'Sana', 'S', 'Lenin', 'Sana@ccc.com', 'Female', 2, 3),
   (7, '   James', 'J', 'Bond', 'James@bbb.com', 'Male',1 ,3 ),
   (8, '  Rob', 'R', 'Hunter', 'Rob@ccc.com', 'Male', 2,2  ),
   (9, 'Steve', 'S', 'Wilson', 'Steve@aaa.com', 'Male', 1, 2),
   (10, 'Pam', 'P', 'Broker', 'Pam@bbb.com', 'Female',2,1);

   SELECT FirstName, MiddleName, LastName FROM tblEmployee;

   SELECT LTRIM(FirstName) AS FirstName, MiddleName, LastName FROM tblEmployee

   SELECT RTRIM('    Hello   ')

   SELECT LTRIM(FirstName) AS FirstName, MiddleName, LastName,
   FirstName + ' ' + MiddleName + ' ' + LastName AS FullName
   FROM tblEmployee;

   SELECT LTRIM(FirstName) AS FirstName, MiddleName, LastName,
  RTRIM(LTRIM(FirstName)) + ' ' + MiddleName + ' ' + LastName AS FullName
   FROM tblEmployee

   SELECT UPPER(LTRIM(FirstName)) AS FirstName, MiddleName, LOWER(LastName),
   RTRIM(LTRIM(FirstName)) + ' ' + MiddleName + ' ' + LastName AS FullName
   FROM tblEmployee

   SELECT REVERSE(UPPER(LTRIM(FirstName))) AS FirstName, MiddleName, LOWER(LastName) AS LastName, 
   RTRIM(LTRIM(FirstName)) + ' ' + MiddleName + ' ' + LastName AS FullName
   FROM tblEmployee

   SELECT FirstName FROM tblEmployee;

   SELECT FirstName, LEN(FIRSTNAME) AS [Total Characters] FROM tblEmployee;

   SELECT FirstName, LEN(LTRIM(FIRSTNAME)) AS [Total Characters] FROM tblEmployee

   /*
   ## String Functions Interview Questions

1. What are String Functions in SQL Server?
2. Why do we use String Functions?
3. What is the difference between `ASCII()` and `CHAR()`?
4. What does the `ASCII()` function return?
5. What does the `CHAR()` function return?
6. What are the ASCII values of `'A'`, `'a'`, and `'0'`?
7. What is the purpose of `LTRIM()`?
8. What is the purpose of `RTRIM()`?
9. What is the difference between `LTRIM()` and `RTRIM()`?
10. What is the difference between `UPPER()` and `LOWER()`?
11. What does the `REVERSE()` function do?
12. What is the purpose of the `LEN()` function?
13. Does `LEN()` count leading and trailing spaces?
14. What is the difference between `LEN()` and `DATALENGTH()`?
15. How do you remove leading and trailing spaces from a string?
16. How do you convert a string to uppercase?
17. How do you convert a string to lowercase?
18. How do you reverse a string in SQL Server?
19. How do you find the length of a string after removing leading spaces?
20. How do you concatenate `FirstName`, `MiddleName`, and `LastName` into a single `FullName` column?
21. What happens if one of the values (such as `MiddleName`) is `NULL` while concatenating strings?
22. How can you avoid `NULL` values while concatenating strings?
23. How do you clean imported data that contains unwanted leading or trailing spaces?
24. Write a query to display employee names in uppercase.
25. Write a query to display employee names in lowercase.
26. Write a query to remove leading and trailing spaces from `FirstName`.
27. Write a query to reverse the `FirstName`.
28. Write a query to display the length of `FirstName`.
29. Write a query to display the ASCII value of `'A'`.
30. Write a query to display the character for ASCII value `65`.
31. Write a query to create a `FullName` column after removing unnecessary spaces.

*/