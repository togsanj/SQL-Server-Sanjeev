--Multi-Statement Table Valued Functions
/*
In this session we will learn 
  Creating Multi-Statement Table Valued Function
  Difference between inline and multi-statement Table Valued Functions

Pre-requisite
part 30 - User Defined Functions
Part 31 - Inline Table Valued Functions

Multi-Statement Table Valued Functions
Multi statement table valued functions are very similar to Inline Table functions, with a few differences.
*/

CREATE DATABASE Part32Sample;

USE Part32Sample;
GO

  CREATE TABLE tblEmployees
    (
    Id INT PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    DateOfBirth DATETIME2 NOT NULL,
    Gender NVARCHAR(20) NOT NULL,
    DepartmentId INT NOT NULL
    );

     INSERT INTO tblEmployees (Id, Name, DateOfBirth, Gender, DepartmentId) VALUES 
   (1, 'Sam', '1980-12-30 00:00:00.000', 'Male', 1),
   (2, 'Pam', '1982-09-01 12:02:36.260','Female', 2),
   (3, 'John', '1985-08-22 12:03:30.370', 'Male', 1),
   (4, 'Sara', '1979-11-29 12:59:30.670', 'Female', 3),
   (5, 'Todd', '1978-11-29 12:59:30.670', 'Male', 1);

 ---------------------------------------------------
-- Inline Table Valued Function
---------------------------------------------------
   CREATE FUNCTION fn_ILTVF_GetEmployees()
   RETURNS TABLE
   AS
   RETURN 
  ( 
  SELECT 
     Id, 
     Name, 
     CAST(DateOfBirth AS DATE) AS DOB 
     FROM tblEmployees
     );


SELECT * FROM [dbo].[fn_ILTVF_GetEmployees]();

---------------------------------------------------
-- Multi-Statement Table Valued Function
---------------------------------------------------
   CREATE FUNCTION fn_MSTVF_GetEmployees()
   RETURNS @Table TABLE 
   (
   Id int, 
   Name NVARCHAR(20), 
   DOB Date
   )
   AS
   BEGIN
     INSERT INTO @Table
     SELECT 
     Id, 
     Name, 
     CAST(DateOfBirth AS Date) 
     FROM tblEmployees

     RETURN
   END;

   SELECT * FROM [dbo].[fn_MSTVF_GetEmployees]();

 /*  Differences 
 1.In an Inline Table Valued function, the RETURNS clause cannot contain the structure of the table,
 the function returns. Where as, with the multi-statement table valued function, we specify the 
 structure of the table that gets returned

 2.Inline Table Valued function cannot have BEGIN and END block, where as the multi-statement 
 function can have.

 3.Inline Table valued functions are better for performance, than multi-statement table valued 
 functions. If the given task, can be achieved using an inline table valued function, always prefrer to 
 use them, over multi-statement table valued function

 4.It's possible to update the underlying table, using an inline table valued function, but not possible 
 using multi-statement table valued function.

 Reason for improved perfomance of an inline table valued function:
 internally, SQL Server treats an inline table valued function much like it would a view and treats a 
 multi-statement table valued function similar to how it would a stored procedure.
 */

 ---------------------------------------------------
-- Update through Inline TVF (Works)
---------------------------------------------------
 UPDATE [dbo].[fn_ILTVF_GetEmployees]() SET NAME = 'Sam1' WHERE Id=1

 ---------------------------------------------------
-- Update through Multi-Statement TVF (Fails)
---------------------------------------------------
 UPDATE [dbo].[fn_MSTVF_GetEmployees]() SET NAME = 'Sam' WHERE Id=1

 /*
 ===============================
SQL Server Interview Questions
Multi-Statement Table Valued Functions (MSTVF)
===============================

1. What is a Multi-Statement Table Valued Function (MSTVF)?

Answer:
A Multi-Statement Table Valued Function is a user-defined function that returns a table variable and can contain multiple SQL statements inside a BEGIN...END block.

--------------------------------------------------

2. What does an MSTVF return?

Answer:
It returns a table variable.

--------------------------------------------------

3. How do you create an MSTVF?

Answer:
CREATE FUNCTION FunctionName()
RETURNS @Table TABLE(...)
AS
BEGIN
    INSERT INTO @Table
    ...
    RETURN
END

--------------------------------------------------

4. Can an MSTVF accept parameters?

Answer:
Yes.

--------------------------------------------------

5. Can an MSTVF contain BEGIN...END?

Answer:
Yes.

--------------------------------------------------

6. Can variables be declared inside an MSTVF?

Answer:
Yes.

--------------------------------------------------

7. Can IF...ELSE be used inside an MSTVF?

Answer:
Yes.

--------------------------------------------------

8. Can WHILE loops be used inside an MSTVF?

Answer:
Yes.

--------------------------------------------------

9. Can multiple INSERT statements be used inside an MSTVF?

Answer:
Yes.

--------------------------------------------------

10. Can JOIN be used inside an MSTVF?

Answer:
Yes.

--------------------------------------------------

11. Can aggregate functions (COUNT, SUM, AVG, MIN, MAX) be used?

Answer:
Yes.

--------------------------------------------------

12. What is the purpose of the RETURNS clause?

Answer:
It defines the structure of the table variable returned by the function.

--------------------------------------------------

13. What is the main difference between Inline TVF and MSTVF?

Answer:
Inline TVF returns the result of a single SELECT statement, whereas MSTVF returns a table variable and can contain multiple SQL statements.

--------------------------------------------------

14. Which performs better: Inline TVF or MSTVF?

Answer:
Inline Table Valued Function.

--------------------------------------------------

15. Why is Inline TVF faster?

Answer:
Because SQL Server treats an Inline TVF like a View, allowing better query optimization.

--------------------------------------------------

16. Why is MSTVF slower?

Answer:
Because SQL Server treats it similarly to a Stored Procedure and the returned table variable has limited optimization.

--------------------------------------------------

17. Can an Inline TVF be updated?

Answer:
Yes, if it satisfies SQL Server's updateable view rules.

--------------------------------------------------

18. Can an MSTVF be updated?

Answer:
No.

--------------------------------------------------

19. Why can't an MSTVF be updated?

Answer:
Because it returns a table variable instead of the underlying base table.

--------------------------------------------------

20. Can an MSTVF call another function?

Answer:
Yes.

--------------------------------------------------

21. Can an MSTVF call a Stored Procedure?

Answer:
No.

--------------------------------------------------

22. Can dynamic SQL be used inside an MSTVF?

Answer:
No.

--------------------------------------------------

23. Can temporary tables (#Temp) be used inside an MSTVF?

Answer:
No.

--------------------------------------------------

24. Can table variables be used inside an MSTVF?

Answer:
Yes.

--------------------------------------------------

25. When should you use an MSTVF?

Answer:
When the logic requires multiple SQL statements, variables, IF...ELSE, loops, or complex business logic.

--------------------------------------------------

26. When should you use an Inline TVF?

Answer:
When the task can be completed using a single SELECT statement for better performance.

--------------------------------------------------

27. How do you execute an MSTVF?

Answer:
SELECT * FROM dbo.FunctionName();

--------------------------------------------------

28. What are the advantages of an MSTVF?

Answer:
• Supports multiple SQL statements
• Supports variables
• Supports IF...ELSE
• Supports loops
• Handles complex business logic
• Returns tabular data

--------------------------------------------------

29. What are the disadvantages of an MSTVF?

Answer:
• Slower than Inline TVFs
• Limited query optimization
• Cannot update the underlying table
• Cannot execute dynamic SQL
• Cannot call Stored Procedures

--------------------------------------------------

30. Most Asked Interview Question

Q. Why is an Inline Table Valued Function faster than a Multi-Statement Table Valued Function?

Answer:
Inline TVFs are treated by SQL Server like Views, allowing the query optimizer to generate efficient execution plans. MSTVFs return a table variable and are treated more like Stored Procedures, which limits optimization. Therefore, Inline TVFs generally provide better performance.