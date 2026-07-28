--Functions - Important Concepts
/*
In this session we will learn
   >>Deterministic and NonDetereministic Functions
   >>Encrypting functions
   >>Schema binding functions

   Pre-requisite
   Part 30 - Scalar User Defined Functions
   Part 31 - Inline Table Valued Functions
   Part 32 - Multi-Statement Table Valued Functions

   --## Deterministic and Nondeterministic ##
   Deterministic functions always return the same result any time they are called with a
   specific set of input values and given the same state of the database.
   Examples: Square(), Power(), Sum(), AVG() and Count()

   Note: All aggregate functions are deterministic functions

   Nondeterministic functions may return different results each time they are called with a 
   specific set of input values even if the databases state that they access remains the 
   same.
   Examples:GetDate() and CURRENT_TIMESTAMP

   RAND() function is a Non-deterministic function, but if you provide the seed value, the 
   function becomes deterministic, as the same value gets returned for the same seed 
   value.

   SELECT RAND();      -- Different value each time
   SELECT RAND(100);   -- Same value every time
   */

   CREATE DATABASE Part33Sample;

   USE Part33sample
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

   SELECT * FROM tblEmployees;

   ---------------------------------------------------
-- Deterministic Function
---------------------------------------------------
-- Same input → Same output

   SELECT COUNT(*) FROM tblEmployees;

   SELECT SQUARE(3);


   ---------------------------------------------------
-- Non-Deterministic Function
---------------------------------------------------
-- Same input → Different output possible

   SELECT GETDATE();

   SELECT CURRENT_TIMESTAMP;

   SELECT RAND();

   -- RAND() with seed becomes Deterministic
SELECT RAND(100);
SELECT RAND(100);


   --## WITH ENCRYPTION and SCHEMABINDING ##
   /*
   Encrypting a function definition using WITH ENCRYPTION OPTION:
   We have learnt how to encrypt Stored procedure text using WITHENCRYPTION in 
   Part18 of this video series. Along the same lines, you can also encrypt a function text.
   Once, encrypted, you cannot view the text of the function, using sp_helptext system 
   stored procedure. If you try to, you will get a message stating 'The text for object is 
   encrypted'. There are ways to decrypt, which is beyond the scope of this video.

   Use WITHENCRYPTION

   Creating a function WITH SCHEMABINDING option:
   Schemabinding, specifies that the function is bound to the database objects that it 
   references. When SCHEMABINDING is specified, the base objects cannot be modified in 
   any way that would affect the function definition. The function definition itself must first 
   be modified or dropped to remove dependencies on the object that is to be modified.

   Use WITHSCHEMABINDING
   */

   ---------------------------------------------------
-- Function without Encryption
---------------------------------------------------
   CREATE FUNCTION fn_GetNameById(@Id INT)
   RETURNS NVARCHAR(30)
   AS
   BEGIN
      RETURN
        (SELECT Name FROM tblEmployees WHERE Id = @Id)
   END

   SELECT dbo.fn_GetNameById(1)

   -- View Function Definition
  EXEC sp_helptext fn_GetNameById

   ---------------------------------------------------
-- Function with ENCRYPTION
---------------------------------------------------
     ALTER FUNCTION fn_GetNameById(@Id INT)  
   RETURNS NVARCHAR(30)  
   WITH ENCRYPTION 
   AS  
   BEGIN  
      RETURN  
        (SELECT Name FROM tblEmployees WHERE Id = @Id)  
   END  

   -- Cannot view encrypted function definition
EXEC sp_helptext 'fn_GetNameById';

---------------------------------------------------
-- Function without Encryption
---------------------------------------------------
   ALTER FUNCTION fn_GetNameById(@Id INT)  
   RETURNS NVARCHAR(30)  
   AS  
   BEGIN  
      RETURN  
        (SELECT Name FROM tblEmployees WHERE Id = @Id)  
   END  

   ---------------------------------------------------
-- Function with SCHEMABINDING
---------------------------------------------------
   ALTER FUNCTION fn_GetNameById(@Id INT)  
   RETURNS NVARCHAR(30) 
   WITH SCHEMABINDING
   AS  
   BEGIN  
      RETURN  
        (SELECT Name FROM dbo.tblEmployees WHERE Id = @Id)  
   END  

---------------------------------------------------
-- Cannot Drop Referenced Table
---------------------------------------------------
DROP TABLE dbo.tblEmployees;
-- Error: Cannot DROP TABLE because it is referenced
-- by the schema-bound function.


   