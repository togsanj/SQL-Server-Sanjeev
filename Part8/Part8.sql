-- Retreiving Identity Column values 

/*
In this session we will learn 

 -->How to get the last generated identity column value 

 -->Difference between SCOPE_IDENTITY(), @@iDENTITY and 
 IDENT_CURRENT('TableName')

 


 Retreiving Identity Column values 

 Pre Req - Part 7 - Identity Column in SQL Server

 From the previous session, we understood that identity column values are auto generated. There are several ways in sql server, to retreive the last identity value that is generated. The most common wyas is to use SCOPE_IDENTITY()  built in function.

 Difference:
 SCOPE_IDENTITY() - Same session and the same scope.
 @@IDENTITY - Same session and across any scope.
 IDENT_CURRENT('TableName') - Specific table across any session and any scope.

 */

 CREATE DATABASE Part8Sample;

 USE [Part8Sample]
 GO

 CREATE TABLE Test1
 (
 ID INT IDENTITY(1,1),
 Value NVARCHAR(20)
 );

 CREATE TABLE Test2
 (
 ID INT IDENTITY(1,1),
 Value NVARCHAR(20)
 );

 INSERT INTO Test2 VALUES('zzz')

 SELECT SCOPE_IDENTITY()
 SELECT @@iDENTITY 
 SELECT IDENT_CURRENT('Test2')

 INSERT INTO Test1 VALUES ('X')

 SELECT * FROM Test1;
  SELECT * FROM Test2;

 CREATE TRIGGER trForInsert ON Test1 FOR INSERT
 AS
 BEGIN
   INSERT INTO test2 VALUES ('YYYY')
 END

 SELECT SCOPE_IDENTITY()
 SELECT @@IDENTITY 

