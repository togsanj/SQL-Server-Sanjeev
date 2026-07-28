--Indexes
/*
In this session we will learn
What are indexes
Why do we use indexes
Advantages of indexes


Why Indexes
Indexes are used by queries to find data from tables quickly. Indexes are created on 
tables and views. Index on a table or a view, is very similar to an index that we find in a 
book.

If you don't have an index, and I ask you to locate a specific chapter in the book, you will 
have to look at every page starting from the frist page of the book.

On the other hand, if you have the index, you lookup the page number of the chapter in 
the index, and then directly go to that page number to locate the chapter.

Obviously, the book index is helping to drastically reduce the time it takes to find the 
chapter.

In a similar way, Table and View indexes, can help the query to find data quickly.

In fact, the existance of the right indexes, can drastically improve the performance of the 
query. If there is no index to help the query, then the query engine, checks every row in 
the table from the begining to the end. This is called as table Scan. Tables scan is bad 
for performance.

*/
--##Index Example ##
--At the moment, the Employees table, does not have an index on SALARY column.

CREATE DATABASE Part35Sample;

USE Part35Sample;
GO

DROP TABLE tblEmployee;

CREATE TABLE tblEmployee
(
Id INT ,
Name NVARCHAR(50) NOT NULL,
Salary INT NOT NULL,
Gender NVARCHAR(50) NOT NULL
);

INSERT INTO tblEmployee (Id, Name, Salary, Gender) VALUES
(1, 'Sam', 25000, 'Male'),
(2, 'Pam', 65000, 'Female'),
(3, 'John', 45000, 'Female'),
(4, 'Sara', 55000, 'Female'),
(5, 'Todd', 31000, 'Male');

SELECT * FROM tblEmployee
WHERE Salary > 50000 AND Salary < 70000;

/*
To find all the employees, who has salary greater than 5000 and less than 
7000, the query engine has to check each and every row in the table, resulting 
in a table scan, which can adversely affect the performance, especially if the 
table is large. Since there is no index, to help the query, the query engine 
performs an engine table scan. */

--## Creating an Index ##
    CREATE Index IX_tblEmployee_Salary
    ON tblEmployee (Salary ASC) 
    /*
    The index stores salary of each employees, in the ascending order as shown below. The actual index 
    may look slightly different.

    Now, when the SQL server has to execute the same query, it has an index on the salary column to 
    help this query. Salaries between the range of 50000 and 70000 are usually present at the botton, 
    since the salaries are arranged in an ascending order. SQL server picks up the row addresses from 
    the index and directly fetch the records from the table, rather than ascending each row in the table.
    This is called as index Seek.

    Next Video - Different Types of indexes, Disadvantages etc....
    */
    EXEC sp_helpindex tblEmployee

    DROP Index tblEmployee.IX_tblEmployee_Salary

    /*
    SQL Server Interview Questions – (Indexes)

1. What is an Index in SQL Server?
2. Why are Indexes used in SQL Server?
3. How does an Index improve query performance?
4. What is the difference between a Table Scan and an Index Seek?
5. Why is a Table Scan considered expensive?
6. On which database objects can Indexes be created?
7. What happens if a query searches a column without an Index?
8. Which SQL statement is used to create an Index?
9. How do you create an Index on the Salary column?
10. What is the purpose of the ASC keyword while creating an Index?
11. How can you view all Indexes on a table?
12. Which system stored procedure is used to display Index information?
13. How do you delete an Index in SQL Server?
14. Can an Index be created on multiple columns?
15. Does an Index store the actual table data or references to the data?
16. What is an Index Seek?
17. When does SQL Server choose a Table Scan instead of an Index Seek?
18. Why are Indexes especially useful for large tables?
19. Can creating unnecessary Indexes affect database performance?
20. What are the main advantages of using Indexes?
*/