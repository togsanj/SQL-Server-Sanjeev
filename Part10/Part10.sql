-- All about "SELECT"

/*
>In this session we will learn 
>Select specific or all columns
>Distinct rows
>Filtering with where clause
>Wild Cards in SQL Server
>Joining multiple conditions using AND and OR operators
>Sorting rows using order by 
>Selecting top n or top n percentage of rows 
*/

CREATE DATABASE Part10Sample;

USE Part10Sample;
GO

CREATE TABLE tblPerson
(
ID INT PRIMARY KEY,
Name NVARCHAR(50) NOT NULL,
Email NVARCHAR(50) NOT NULL,
GenderID INT,
Age INT,
City NVARCHAR(50) NOT NULL
);

INSERT INTO tblPerson VALUES 
(1, 'Tom', 't@t.com', 1, 23, 'London'),
(2, 'John', 'j@j.com', 1, 20, 'New York'),
(3, 'May', 'may@may.com', 2, 21,'Sydney'),
(4, 'John', 'john@dell.com', 1, 29, 'London'),
(5, 'Sara', 'sara@abc.com',2 , 25,'Mumbai')

SELECT DISTINCT City FROM tblPerson 

SELECT * FROM tblPerson WHERE City = 'London' 

SELECT DISTINCT Name, City FROM tblPerson;

SELECT * FROM tblPerson WHERE City <> 'London';

SELECT * FROM tblPerson WHERE City != 'London'

-- Operators and Wild Cards 
/*Operator         Purpose     
 =               Equal to 
 != or <> Not   Not equal to 
 >               Greater than
 >=             Greater than or equal to 
 <              Less than 
 <=             Less than or equal to
 IN             Specify a list of values 
 BETWEEN        Specify a range 
 LIKE           Specify a pattern
 NOT            Not in a list, range etc...
 %             Specifies zero or more characters 
 _              Specifies exactly one character
 []             Any character with in the brackets
 [^]            Not any characters with in the brackets
 */

 SELECT * FROM tblPerson WHERE Age = 20 OR Age = 23 OR Age = 29;

 SELECT * FROM tblPerson WHERE Age IN (20, 23, 29);

 SELECT * FROM tblPerson WHERE Age BETWEEN 20 AND 25

 SELECT * FROM tblPerson WHERE City LIKE 'L%'

 SELECT * FROM tblPerson WHERE Email LIKE '%@%'

 SELECT * FROM tblPerson WHERE Email NOT LIKE '%@%'

 SELECT * FROM tblperson WHERE Email LIKE '_@_.com';

 SELECT * FROM tblPerson WHERE Email NOT LIKE '_@_.com'

 UPDATE tblPerson
SET
Email = 'may.may.com'
WHERE ID = 3;

 SELECT * FROM tblPerson WHERE Name LIKE '[MST]%'

 SELECT * FROM tblPerson WHERE Name LIKE '[^MST]%'

 SELECT * FROM tblPerson;

 SELECT * FROM tblPerson WHERE (City = 'London' OR City = 'Mumbai') AND Age > 25

 SELECT * FROM tblPerson ORDER BY Name

 SELECT * FROM tblPerson ORDER BY Name DESC

 SELECT * FROM tblPerson ORDER BY Name DESC, Age ASC

 SELECT top 2 * FROM tblPerson

 SELECT top 2 Name, Age FROM tblPerson

 SELECT top 1  Percent * FROM tblPerson

 SELECT top 50 Percent *  FROM tblPerson

 SELECT * FROM tblPerson ORDER BY Age DESC;

 SELECT top 1 * FROM tblPerson ORDER BY Age DESC