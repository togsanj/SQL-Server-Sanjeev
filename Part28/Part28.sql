-- Cast and Convert functions 
/*
In this session we will learn
   CAST and CONVERT functions
   When to choose one over the other

   CAST & CONVERT
   To convert one data type to another, CAST and CONVERT functions can be used

   --Syntax of CAST and CONVERT functions from MSDN
   CAST(expression AS data_type[(length)])
   CONVERT(data_type[(length)], expression[, style])
   */

   CREATE DATABASE Part28Sample;

   USE Part28Sample;
   GO

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

     CREATE TABLE tblEmployees
    (
    Id INT PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    DateOfBirth DATETIME2 NOT NULL,
    )

       INSERT INTO tblEmployees (Id, Name, DateOfBirth) VALUES 
   (1, 'Sam', '1980-12-30 00:00:00.000'),
   (2, 'Pam', '1982-09-01 12:02:36.260'),
   (3, 'John', '1985-08-22 12:03:30.370'),
   (4, 'Sara', '1979-11-29 12:59:30.670')

   CREATE TABLE tblRegistrations
   (
   Id INT PRIMARY KEY,
   Name NVARCHAR(50) NOT NULL,
   Email NVARCHAR(50) NOT NULL,
   RegisteredDate DATETIME2 NOT NULL
   );

   INSERT INTO tblRegistrations (Id, Name, Email, RegisteredDate) VALUES 
   (1, 'John', 'j@j.com', '2012-08-24 11:04:30.230'),
   (2, 'Sam', 's@s.com', '2012-08-25 14:04:29.780'),
   (3, 'Todd', 't@t.com', '2012-08-25 15:04:29.780'),
   (4, 'May', 'm@m.com', '2012-08-24 15:04:30.730'),
   (5, 'Sunil', 'sunil@s.com', '2012-08-24 15:05:30.330'),
   (6, 'Mike', 'mike@m.com', '2012-08-26 15:05:30.330');

   SELECT * FROM tblRegistrations

   SELECT Id, Name, DateOfBirth, CAST(DateOfBirth AS NVARCHAR(5)) AS ConvertedDOB FROM tblEmployees
   SELECT Id, Name, DateOfBirth, Convert(NVARCHAR, DateOfBirth) AS ConvertedDOB FROM tblEmployees

   SELECT Id, Name, DateOfBirth,
   CONVERT(NVARCHAR(30), DateOfBirth, 103) AS ConvertedDOB
   FROM tblEmployees

   --DatePart of DateTime

         --To get just the date part, from DateTime
         SELECT CONVERT(VARCHAR(10), GETDATE(), 101) --Returns 09/02/2012

         --In SQL Server 2008, Date datatype is introduced, so you can also use
         SELECT CAST(GETDATE() AS DATE) --2012-09-02
         SELECT CONVERT(DATE, GETDATE()) --2012-09-02

         --Note: To control the formatting of the Date part, DateTime has to be converted to NVARCHAR using the styles provided. When converting to DATE data type, the CONVERT() function will ignore the style parameter.

         --Concatenate Id(INT) and Name(NVARCHAR)
         SELECT Id, Name, Name + ' _ ' + CAST(Id AS NVARCHAR) AS [Name-Id] FROM tblEmployees

         --Practical Example

         SELECT CAST(RegisteredDate AS DATE) AS RegistrationDate, COUNT(Id) AS TotalRegistrations
         FROM tblRegistrations
         GROUP BY CAST(RegisteredDate AS DATE)

         SELECT RegisteredDate AS RegistrationDate, COUNT(Id) AS TotalRegistrations
         FROM tblRegistrations
         GROUP BY RegisteredDate

         SELECT CAST(RegisteredDate AS DATE) AS RegistrationDate, COUNT(Id) AS Total
         FROM tblRegistrations
         GROUP BY CAST(RegisteredDate AS DATE)

         /*
         Difference CAST - CONVERT

         1.Cast is based on ANSI standard and Convert is specific to SQL Server. So, if portability is a 
         concern and if you want to use the script with other database applications, use Cast().

         2.Convert provides more flexibility than Cast. For example, it's possible to control how you want 
         DateTime datatypes to be converted using styles with convert function.

         Note: The general guideline is to use CAST(), unless you want to take advantage of the style functionality in CONVERT().

         */


   -- Microsoft Documentation
   --https://msdn.microsoft.com/en-us.library/ms187928.aspx

   -- Microsoft Documentation
-- https://learn.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql


/*
##  CAST() & CONVERT() Functions Interview Questions

1. What is data type conversion in SQL Server?
2. What are the CAST() and CONVERT() functions?
3. What is the syntax of the CAST() function?
4. What is the syntax of the CONVERT() function?
5. What is the difference between CAST() and CONVERT()?
6. Which function is ANSI SQL standard: CAST() or CONVERT()?
7. Which function is SQL Server specific?
8. When should you use CAST() instead of CONVERT()?
9. When should you use CONVERT() instead of CAST()?
10. Can CAST() format DateTime values?
11. What is the purpose of the style parameter in CONVERT()?
12. What are style codes in CONVERT()?
13. What is the difference between CONVERT(VARCHAR, Date, 101) and CONVERT(VARCHAR, Date, 103)?
14. What is the difference between CAST(GETDATE() AS DATE) and CONVERT(DATE, GETDATE())?
15. Does the style parameter work when converting to the DATE data type?
16. How do you convert an INT value to NVARCHAR?
17. How do you convert a DateTime value to a string?
18. How do you convert a string to a DateTime value?
19. What happens if an invalid conversion is attempted?
20. What is implicit conversion in SQL Server?
21. What is explicit conversion in SQL Server?
22. Can CAST() and CONVERT() be used in a SELECT statement?
23. Can CAST() and CONVERT() be used in a WHERE clause?
24. Can CAST() and CONVERT() be used with GROUP BY?
25. Why is CAST(RegisteredDate AS DATE) used in the registration example?
26. What is the difference between grouping by DATETIME and grouping by DATE?
27. How do you concatenate an INT column with an NVARCHAR column?
28. Why is CAST(Id AS NVARCHAR) required while concatenating?
29. What is the output of CAST(GETDATE() AS DATE)?
30. What is the output of CONVERT(VARCHAR(10), GETDATE(), 101)?
31. What are the most commonly used CONVERT() style codes?
32. What is the difference between style 101 and style 103?
33. Which function provides more flexibility: CAST() or CONVERT()?
34. Which function is more portable across different database systems?
35. Can CAST() change the display format of a date?
36. Can CONVERT() return dates in different formats?
37. What is the difference between DATE, DATETIME and DATETIME2 during conversion?
38. What are the advantages of using CAST()?
39. What are the advantages of using CONVERT()?
40. Explain a real-time scenario where CAST() and CONVERT() are used.
*/

