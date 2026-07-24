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


 /*
 # Part 10 – SELECT Statement (Interview Questions)

## Basic Questions

1. What is the `SELECT` statement in SQL Server?
2. Why do we use the `SELECT` statement?
3. How do you select all columns from a table?
4. How do you select specific columns from a table?
5. What is the difference between `SELECT *` and selecting specific columns?

## DISTINCT Questions

6. What is the `DISTINCT` keyword?
7. Why do we use `DISTINCT`?
8. Can `DISTINCT` be used on multiple columns?
9. What is the difference between `SELECT` and `SELECT DISTINCT`?
10. Does `DISTINCT` remove duplicate rows or duplicate values?

## WHERE Clause Questions

11. What is the `WHERE` clause?
12. Why do we use the `WHERE` clause?
13. Which operators can be used with the `WHERE` clause?
14. What is the difference between `=` and `<>` (`!=`) operators?
15. What is the difference between `AND` and `OR` operators?
16. What is the purpose of the `NOT` operator?
17. What is operator precedence in the `WHERE` clause?

## IN & BETWEEN Questions

18. What is the `IN` operator?
19. Why do we use the `IN` operator?
20. What is the difference between `IN` and multiple `OR` conditions?
21. What is the `BETWEEN` operator?
22. Is the `BETWEEN` operator inclusive or exclusive?

## LIKE & Wildcard Questions

23. What is the `LIKE` operator?
24. Why do we use the `LIKE` operator?
25. What are wildcards in SQL Server?
26. What does `%` represent in a `LIKE` pattern?
27. What does `_` represent in a `LIKE` pattern?
28. What does `[ ]` represent in a `LIKE` pattern?
29. What does `[^ ]` represent in a `LIKE` pattern?
30. What is the difference between `%` and `_`?
31. What is the difference between `LIKE` and `NOT LIKE`?

## ORDER BY Questions

32. What is the `ORDER BY` clause?
33. Why do we use `ORDER BY`?
34. What is the default sorting order in SQL Server?
35. What is the difference between `ASC` and `DESC`?
36. Can we sort by multiple columns?

## TOP Questions

37. What is the `TOP` clause?
38. Why do we use the `TOP` clause?
39. What is the difference between `TOP n` and `TOP n PERCENT`?
40. How do you retrieve the highest salary or oldest employee using `TOP`?
41. Why should `ORDER BY` be used with `TOP`?

## Scenario-Based Questions

42. How do you retrieve unique city names?
43. How do you find employees whose age is between 20 and 25?
44. How do you find employees whose names start with 'M'?
45. How do you find invalid email addresses using `LIKE`?
46. How do you retrieve the oldest employee?
47. How do you retrieve the top 50% of records?
48. How do you filter records using multiple conditions?

## Real-World Questions

49. Where is the `SELECT` statement used in real-world applications?
50. What are the advantages of using `DISTINCT`?
51. What are the advantages of using `ORDER BY`?
52. Why are wildcards useful in searching data?
53. Give a real-world example of using `LIKE`.

# ⭐ Most Important Questions (Freshers)

1. What is the `SELECT` statement?
2. What is the difference between `SELECT *` and selecting specific columns?
3. What is the `DISTINCT` keyword?
4. What is the `WHERE` clause?
5. What is the difference between `AND` and `OR`?
6. What is the difference between `IN` and `BETWEEN`?
7. What is the `LIKE` operator? Explain all wildcards (`%`, `_`, `[ ]`, `[^ ]`).
8. What is the `ORDER BY` clause? Explain `ASC` and `DESC`.
9. What is the `TOP` clause? Explain `TOP n` and `TOP n PERCENT`.
10. Why should `ORDER BY` be used with the `TOP` clause?
*/