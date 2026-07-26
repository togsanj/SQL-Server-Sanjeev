-- DateTime functions in SQL Server
/*
In this session we will learn

DateTime data types
DateTime functions
Understand UTC time and Time Zone offset

UTC stands for Coordinated Universal Time, based on which, the world 
regulates clocks and time. There are slight differences between GMT and 
UTC, but for most common purposes, UTC is synonymous with GMT.

Function          |    Date Time Format                  | Description   
GETDATE()         |   2012-08-31 20:15:04.543            | Commonly used
CURRENT_TIMESTAMP |   2012-08-31 20:15:04.543            | ANSI SQL equivalent to GETDATE
SYSDATETIME()     |   2012-08-31 20:15:04.5380028        |  More fractional seconds precision
SYSDATETIMEOFFSET()|   2012-08-31 20:15:04.5380028+01:00  | More fractional seconds precision + Time zone offset
GETUTCDATE()      |   2012-08-31 19:15:04.543            | UTC Date and Time
SYSUTCDATETIME()  |   2012-08-31 19:15:04.5380028        | UTC Date and Time, with More fractional seconds precision
*/

Function          |    Date Time Format                  | Description   
GETDATE()         |   2026-07-26 19:45:30.123           | Commonly used
CURRENT_TIMESTAMP |   2026-07-26 19:45:30.123           | ANSI SQL equivalent to GETDATE
SYSDATETIME()     |   2026-07-26 19:45:30.1234567        |  More fractional seconds precision
SYSDATETIMEOFFSET()|  2026-07-26 19:45:30.1234567 +05:30  | More fractional seconds precision + Time zone offset
GETUTCDATE()      |   2026-07-26 14:15:30.123             | UTC Date and Time
SYSUTCDATETIME()  |   2026-07-26 14:15:30.1234567         | UTC Date and Time, with More fractional seconds precision





CREATE DATABASE Part25Sample;

USE Part25Sample;
GO

CREATE TABLE tblDateTime
(
c_time TIME,
c_date DATE,
c_smalldatetime SMALLDATETIME,
c_datetime DATETIME,
c_datetime2 DATETIME2,
c_datetimeoffset DATETIMEOFFSET
)

SELECT * FROM tblDateTime

INSERT INTO tblDateTime VALUES (GETDATE(), GETDATE(), GETDATE(), GETDATE(), GETDATE(),GETDATE())

UPDATE tblDateTime SET c_datetimeoffset = '2026-07-26 21:34:36.92000000 +01.00'
WHERE c_datetimeoffset = '2026-07-26 21:34:36.9200000 +00:00'

---------------------------------------------------------------------

SELECT GETDATE(), 'GETDATE()'
SELECT CURRENT_TIMESTAMP, 'CURRENT_TIMESTAMP'
SELECT SYSDATETIME(), 'SYSDATETIME()'
SELECT SYSDATETIMEOFFSET(), 'SYSDATETIMEOFFSET()'
SELECT GETUTCDATE(), 'GETUTCDATE()'

/*
-- Interview Questions - Part 25 (DateTime Functions)

1. What are the different Date and Time data types available in SQL Server?
2. What is the difference between DATE and TIME data types?
3. What is the difference between DATETIME and DATETIME2?
4. Why is DATETIME2 preferred over DATETIME?
5. What is the purpose of the SMALLDATETIME data type?
6. How is DATETIMEOFFSET different from DATETIME?
7. Which data type stores Time Zone Offset information?
8. What is the default fractional seconds precision of DATETIME2?
9. Which SQL Server function returns the current local date and time?
10. What is the difference between GETDATE() and CURRENT_TIMESTAMP?
11. Is CURRENT_TIMESTAMP an ANSI SQL standard function?
12. Which function returns higher precision than GETDATE()?
13. What is the difference between SYSDATETIME() and SYSDATETIMEOFFSET()?
14. Which function returns the current UTC date and time?
15. What is the difference between GETUTCDATE() and SYSUTCDATETIME()?
16. Which function provides both UTC time and higher fractional seconds precision?
17. What is UTC (Coordinated Universal Time)?
18. What is a Time Zone Offset?
19. Why is UTC commonly used in distributed applications?
20. How do you insert the current date and time into a table?
21. Can GETDATE() be inserted into DATE, TIME, and DATETIME columns?
22. Why does SQL Server automatically convert GETDATE() when inserting into different Date/Time data types?
23. How do you update a DATETIMEOFFSET column with a specific time zone?
24. What happens if you insert GETDATE() into a DATETIMEOFFSET column?
25. Which function should you use if you need the highest precision current date and time?
26. Which function is most commonly used in SQL Server applications to get the current date and time?
27. Which Date/Time function includes the server's current time zone offset?
28. How do you retrieve only the current UTC date and time in SQL Server?
29. Which Date/Time function returns a DATETIMEOFFSET value?
30. What is the difference between Local Time and UTC Time in SQL Server?

*/