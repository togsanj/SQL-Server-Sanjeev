-- DateTime functions continued
/*
In this session we will learn
   DatePart, DateAdd and DateDiff functions in SQL Server
   A practical example of using these functions

   Prerequisite
   Part 25 - DateTime functions in SQL Server
   Part 26 - DateTime functions continued..

   */


    CREATE DATABASE Part27Sample;

USE Part27Sample;
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

 
 SELECT * FROM tblEmployee;

 SELECT * FROM tblEmployees;

  -- DatePart, DateAdd and DateDiff
   --DatePart(DatePart, Date) - Returns an integer representing the specified DatePart. This function is similar to DateName(). DateName() returns NVARCHAR, 
   --whereas DatePart() returns an integer.

   SELECT DATEPART(weekday, '2012-08-30 19:45:31.793')  --returns 5
   SELECT DATENAME(weekday, '2012-08-30 19:45:31.793')  --returns Thursday

   --DATEADD(datepart, NumberToAdd, date) - Returns the DateTime, after adding specified
  -- NumberToAdd, to the datepart specified of the given date.

  

   --Examples:
   SELECT DateAdd(DAY, 20, '2026-08-30 19:45:31.793')
         --returns 2026-09-19 19:45:31.793
   SELECT DateAdd(DAY, -20, '2026-08-30 19:45:31.793')
         --returns 2026-08-10 19:45:31.793

   DATEDIFF(datepart, startdate, enddate) - Returns the count of the 
   specified datepart boundaries crossed between the specified startdate and enddate.

   --Examples:
   SELECT DATEDIFF(MONTH, '11/30/2015', '01/31/2016') --returns 2
   SELECT DATEDIFF(DAY, '11/30/2015', '01/31/2016') --returns 62

   -- SELECT DATEDIFF(YEAR, '11/30/2005', '01/31/2006') -- retruns 2

  -- Calculating Age

   



  SELECT dbo.fnComputeAge('11/30/2005')

  CREATE function fnComputeAge(@DOB DateTime)

  RETURNS NVARCHAR(50)
  AS
  BEGIN

   DECLARE 
            @tempdate DATETIME, 
            @years INT, 
            @MONTHS int, 
            @DAYS int


   SELECT @tempdate = @DOB

   SELECT @years  = DATEDIFF(YEAR, @tempdate, GETDATE()) -
                    CASE 
                        WHEN MONTH(@DOB) > MONTH(GETDATE()) OR
                        (MONTH(@DOB) = MONTH(GETDATE()) 
                        AND DAY(@DOB) > DAY(GETDATE()))
                        THEN 1 
                        ELSE 0
                      END
  SELECT @tempdate = DATEADD(YEAR, @years, @tempdate)

  SELECT @months = DATEDIFF(MONTH, @tempdate, GETDATE()) -
                  CASE
                    WHEN DAY(@DOB) > DAY(GETDATE())
                    THEN 1 
                    ELSE 0
                  END

  SELECT @tempdate = DATEADD(MONTH, @months, @tempdate)

  SELECT @days = DATEDIFF(DAY, @tempdate, GETDATE())

  Declare @Age NVARCHAR(50)
  SET @Age =  Cast(@years AS NVARCHAR(4)) + ' Years ' + Cast(@months AS NVARCHAR(2)) + '   Months ' + Cast(@days AS NVARCHAR(2)) + ' Days Old' 

      return @Age
END


 SELECT Id, Name, DateOfBirth, dbo.fnComputeAge('11/30/2005') AS Age FROM tblEmployees;

      SELECT Id, Name, DateOfBirth, dbo.fnComputeAge(DateOfBirth) AS Age FROM tblEmployees;

      /*
      ##   DATEPART(), DATEADD(), DATEDIFF() & User Defined Function (Age Calculation) Interview Questions

1. What is the DATEPART() function in SQL Server?
2. What is the syntax of the DATEPART() function?
3. What is the difference between DATEPART() and DATENAME()?
4. What data type does DATEPART() return?
5. What data type does DATENAME() return?
6. What are the commonly used date parts in SQL Server?
7. How do you extract the year, month, day, or weekday from a date?
8. What is the DATEADD() function?
9. What is the syntax of the DATEADD() function?
10. Can DATEADD() add negative values? Explain with an example.
11. What is the DATEDIFF() function?
12. What is the syntax of the DATEDIFF() function?
13. What does DATEDIFF() calculate?
14. What is the difference between DATEADD() and DATEDIFF()?
15. Why is DATEDIFF(YEAR, DOB, GETDATE()) not sufficient for calculating the exact age?
16. Why is the CASE expression used in the fnComputeAge() function?
17. Why is DATEADD() used after calculating years and months?
18. What is the purpose of the GETDATE() function?
19. What happens if the Date of Birth is today's date?
20. What happens if the Date of Birth is a future date?
21. What is a User Defined Function (UDF)?
22. What are the different types of User Defined Functions in SQL Server?
23. What is a Scalar User Defined Function?
24. What is the syntax to create a Scalar Function?
25. What is the purpose of the RETURNS keyword?
26. How do you execute a Scalar Function?
27. Can a Scalar Function accept input parameters?
28. Can a Scalar Function return multiple values?
29. Can a Scalar Function perform INSERT, UPDATE, or DELETE operations?
30. What is the difference between a Stored Procedure and a Scalar Function?
31. Can a Scalar Function be used in a SELECT statement?
32. Can a Scalar Function be used in the WHERE clause?
33. What are the limitations of Scalar Functions?
34. Why is NVARCHAR(50) used as the return type in the fnComputeAge() function?
35. Write a query to extract the month from a date.
36. Write a query to add 30 days to the current date.
37. Write a query to subtract 2 years from today's date.
38. Write a query to calculate the number of days between two dates.
39. Write a query to calculate an employee's age using a User Defined Function.
40. Why is the 'YYYY-MM-DD' date format recommended in SQL Server?