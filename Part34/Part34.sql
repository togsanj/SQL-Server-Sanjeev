--Temporary Tables
/*
In this session we will learn 
   What are temporary tables
   Types of temporary tables - Local and Global
   Difference between local and global temp tables

   What are Temporary tables?
   Temporary tables, are very similar to the permanent tables. Permanent tables get created in the database you specify, and remain in the database permanently, until you delete(drop) them. On the other hand, temporary tables get created in the TempDB and are automatically deleted, when they are no longer used.

   Different Types of Temprary tables
   1.Local Temporary Tables
   2.Global Temporary tables.
   */
   CREATE DATABASE Part34Sample;

   USE Part34Sample;
   GO

   --1st Connection

   --create local Temporary Table
   CREATE TABLE #PersonDetails(Id INT, Name NVARCHAR(20))

    CREATE TABLE PersonDetails(Id INT, Name NVARCHAR(20))

   --INSERT Data into the temporary table
   INSERT INTO #PersonDetails VALUES
   (1, 'Mike'),
   (2, 'John'),
   (3, 'Todd')

   --Select data from the temporary table:
   SELECT * FROM #PersonDetails
   /*
   Local Temporary Tables
   Check if the local temporary table is created:
   Temporary tables are created in the TEMPDB.
   Query the sysobjects system table in TEMPDB. The name of the table, is suffixed with lot of underscores and a random number. For this reason you have to use the LIKE operator in the query.
   */

   SELECT name FROM tempdb..sysobjects
   WHERE name LIKE '#PersonDetails%'

   /*
   A local temporary table is available, only for the connection that has created the table

   A local temporary table is automatically dropped, when the connection that has created the it , it closed.

   If the user wants to explicitly drop the temporary table, he can do so using DROP 
   TABLE #PersonDetails
   */

   --Local Temporary Tables
   --If the temporary table, is created inside the stored procedure, it get's dropped automatically upon the completion of stored procedure execution.

   CREATE PROCEDURE spCreateLocalTempTable
   AS
   BEGIN
   CREATE TABLE #PersonDetails(Id INT, Name NVARCHAR(20))

   INSERT INTO #PersonDetails VALUES
   (1, 'Mike'),
   (2, 'John'),
   (3, 'Todd')

   SELECT * FROM #PersonDetails
   END
   /*
   It is also possible for different connections, to create a local temporary table with the same name.
   For example User1 and User2, both can create a local temporary table with the same name 
   #PersonDetails 
   */
 
 EXEC spCreateLocalTempTable
   
   SELECT * FROM #PersonDetails

   

   
   /*
   --Global Temporary Tables
   To create a Global Temporary Table, prefix the name of the table with 2 pound(##) symbols.
   */
   CREATE TABLE ##EmployeeDetails(Id INT, Name NVARCHAR(20))
   /*
   Global temporary tables are visible to all the connections of the sql server, and are only destroyed when the last connection referencing the table is closed.

   Multiple users, across multiple connections can have local temporary tables with the 
   same name, but, a global temporary table name has to be unique, and if you inspect the 
   name of the global temp table, in the object explorer, there will be no random numbers 
   suffixed at the end of the table name.

   */
     CREATE TABLE ##PersonDetails(Id INT, Name NVARCHAR(20))

        SELECT * FROM ##PersonDetails

        /*
        Difference Between Local and Global Temporary Tables:
        1.Local Temp tables are prefixed with single pound(#) symbol, where as global temp 
        tables are prefixed with 2 pound(##) symbols.

        2.SQL Server appends some random numbers at the end of the local temp table name, 
        where this is not done for global temp table names.

        3.Local temporary tables are only visible to that sessio of the SQL Server which has 
        created it, where as Global temporary tables are visible to all the SQL server sessions

        4.Local temporary tables are automatically dropped, when the session that created the 
        temporary tables is closed, where as Global temporary tables are destroyed when the 
        last connection that is referencing the global temp table is closed.
        */

        /*
        SQL Server Interview Questions –  (Temporary Tables)

1. What is a Temporary Table in SQL Server?
2. Why are Temporary Tables created?
3. In which database are Temporary Tables stored?
4. What is TempDB?
5. What are the two types of Temporary Tables?
6. How do you create a Local Temporary Table?
7. How do you create a Global Temporary Table?
8. What is the purpose of the # symbol in SQL Server?
9. What is the purpose of the ## symbol in SQL Server?
10. Who can access a Local Temporary Table?
11. Who can access a Global Temporary Table?
12. Why does SQL Server append a random suffix to Local Temporary Table names?
13. Why is a random suffix not added to Global Temporary Table names?
14. Can multiple sessions create Local Temporary Tables with the same name?
15. Why must Global Temporary Table names be unique?
16. When is a Local Temporary Table automatically dropped?
17. When is a Global Temporary Table automatically dropped?
18. What happens to a Local Temporary Table created inside a Stored Procedure after the procedure completes?
19. How can you view Temporary Tables in TempDB?
20. Why is the LIKE operator used when searching for Local Temporary Tables in tempdb..sysobjects?
*/