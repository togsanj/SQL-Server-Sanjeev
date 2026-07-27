-- DateTime functions continued
/*
In this session we will learn 
   IsDate, Day, Month, Year and DateName
   A practical example of using thse functions

   Prerequisite
   Part 25 - DateTime functions in SQL Server

   ISDATE()- Checks if the given value, is a valid data, time, or 
   datetime. Returns 1 for success, 0 for failure.
   */
   CREATE DATABASE Part26Sample;

   USE Part26Sample;
   GO
    
    DROP TABLE tblEmployee;

    CREATE TABLE tblEmployee
    (
    Id INT PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    DateOfBirth DATETIME2 NOT NULL,
    )

   INSERT INTO tblEmployee (Id, Name, DateOfBirth) VALUES 
   (1, 'Sam', '1980-12-30 00:00:00.000'),
   (2, 'Pam', '1982-09-01 12:02:36.260'),
   (3, 'John', '1985-08-22 12:03:30.370'),
   (4, 'Sara', '1979-11-29 12:59:30.670')

   -- EXAMPLE

   SELECT ISDATE('SANJEEV') -- return 0
   SELECT ISDATE(Getdate()) -- returns 1
   SELECT ISDATE('2026-08-31 21:02:04.167') -- returns 1
   SELECT ISDATE('2026-09-01 11:34:21.1918447') --returns 0

   Note: For datetime2 values, IsDate returns ZERO.

   --Day()- Returns the 'Day number of the Month' of the given date
   -- Example:
   SELECT DAY(GETDATE()) -- Returns the current date day number of the month
   SELECT DAY('01/31/2026')  --Returns 31


   --Month()- Returns the 'Month number of the year' of the given date
   -- Examples:
   SELECT Month(GETDATE()) -- Returns the current date, Month number of the year
   SELECT Month('01/31/2026') -- Returns 1


   --Year()- Returns the 'Year number' of the given date
   -- Examples: 
   SELECT Year(GETDATE()) -- Returns the current date the year number
   SELECT Year('01/31/2026') -- Returns 2026

   SELECT DATENAME(

   -- Examples:
   SELECT DATENAME(Day, '2026-07-31 12:43:46.837') -- Returns 30
   SELECT DATENAME(WEEKDAY, '2026-07-30 12:43:46.837') -- Returns Sunday
   SELECT DATENAME(MONTH, '2026-09-30 12:43:46.837')   -- Returns September

   SELECT * FROM tblEmployee;

   SELECT Name, DateOfBirth, DateName(WEEKDAY, DateOfBirth) AS [DAY],
          Month(DateOfBirth) AS MonthNumber,
          DateName(Month, DateOfBirth) AS [MonthName],
          Year(DateOfBirth) AS [YEAR]
  FROM  tblEmployee

  sp_help tblEmployee;

  /*
  ## SQL Server Part 26 - DateTime Functions Interview Questions

1. What is the purpose of the ISDATE() function in SQL Server?
2. What does the ISDATE() function return?
3. What is the syntax of the ISDATE() function?
4. Why does ISDATE() return 0 for datetime2 values?
5. What is the difference between DATE and DATETIME2?
6. What is the purpose of the DAY() function?
7. What does the MONTH() function return?
8. What is the purpose of the YEAR() function?
9. What is the purpose of the DATENAME() function?
10. What is the syntax of the DATENAME() function?
11. What is the difference between DATENAME() and DATEPART()?
12. What data type does DATENAME() return?
13. What data type does DATEPART() return?
14. What are the commonly used datepart arguments in DATENAME()?
15. How do you get the weekday name from a date?
16. How do you get the month name from a date?
17. How do you get the month number from a date?
18. How do you extract only the year from a date?
19. How do you extract only the day number from a date?
20. How do you get the current system date and time in SQL Server?
21. Write a query to display an employee's name and birth year.
22. Write a query to display the month name from DateOfBirth.
23. Write a query to display the weekday name from DateOfBirth.
24. Write a query to display the day, month, and year separately from DateOfBirth.
25. Write a query to validate a date using ISDATE().
26. Write a query to return the current month number.
27. Write a query to return the current weekday name.
28. Write a query to display employees born in December.
29. Write a query to display employees born in the year 1980.
30. Write a query to display employees whose birth month is September.
31. When would you use DATENAME() instead of DATEPART()?
32. Why is DATETIME2 recommended over DATETIME?
33. Which function returns the month name instead of the month number?
34. Which function would you use to validate user-entered date values?
35. What happens if an invalid date is passed to ISDATE()?
36. What is the output of SELECT DAY('2026-12-25')?
37. What is the output of SELECT MONTH('2026-12-25')?
38. What is the output of SELECT YEAR('2026-12-25')?
39. What is the output of SELECT DATENAME(MONTH, '2026-12-25')?
40. What is the output of SELECT DATENAME(WEEKDAY, '2026-12-25')?
*/