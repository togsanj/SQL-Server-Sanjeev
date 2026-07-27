--Mathematical functions

--In this session we will learn
/*
Abs
Ceiling
Floor
Power
Rand
Square
Sqrt
Round
*/
--ABS(numeric_expression) - ABS stands for absolute and returns, the absolute(positive) number.
SELECT ABS(-101.5) --returns 101.5, without the - sign

--CEILING(numeric_expression) and FLOOR(numeric_expression)
--CEILING and FLOOR functions accept a numeric expression as a single parameter. CEILING() returns the smallest integer value greater than or equal to the parameter, whereas FLOOR() returns the largest integer less than or equal to the parameter.

SELECT CEILING(15.2) -- Returns 16
SELECT CEILING(-15.2) -- Returns -15

SELECT FLOOR(15.2) --Returns 15
SELECT FLOOR(-15.2) --Returns -16

--Power(expression, power)
--Returns the power value of the specified expression to the specified power.
SELECT POWER(2,3) --Returns 8

--SQUARE(Number)                                      
--Returns the square of the given number.              
SELECT SQUARE(9) --Returns 81                        

--SQRT(Number)
--Returns the square root of the given number
 SELECT SQRT(81) -- Returns 9

/*
RAND() function
RAND([Seed_Value])- Returns a random float number between 0 and 1. Rand() function takes 
an optional seed parameter. When seed value is supplied the RAND() function always returns the 
same value for the same seed.
*/
SELECT RAND(1) --Always returns the same value

--Generate a random number between 1 and 100
SELECT FLOOR(RAND() * 100)

SELECT RAND()

SELECT (RAND() * 100)

SELECT FLOOR(RAND() * 100)

Declare @Counter INT
SET @Counter = 1
WHILE(@Counter <= 10)
  BEGIN
     PRINT FLOOR(RAND() * 100)
     SET @Counter = @Counter + 1
  END
  /*
  ROUND() function
  ROUND(numeric_expression, length[,function])-Returns the given numeric expression based on the given length. This functions takes 3 parameters.
  1.{Numeric_Expression} is the number that we want to round.
  2.{Length} parameters, specifies the number of the digits that we want to round to. If the length is a positive number, then the rounding is applied for the decimal part, whereas if the length is negative, then the rounding is applied to the number before the decimal.
  3.{The optional function parameter}, is used to indicate rounding or truncation operations. 0 indicates rounding, non zero indicates truncation. Default, if not specified is 0.
  */
  --Round to 2 places after (to the right) the decimal points
  SELECT ROUND(850.556, 2) --Returns 850.560

  --Truncate anything after 2 places, after (to the right) the decimal point
  SELECT ROUND(850.556, 2,1) --Returns 850.550

  --Round to 1 place after (to the right) the decimal point
  SELECT ROUND(850.556, 1) --Returns 850.600

  --Truncate anything after 1 place, after (to the right) the decimal point
  SELECT ROUND(850.556, 1, 1) -- Returns 850.500

  --Round the last 2 places after (to the left) the decimal point
  SELECT ROUND(850.556, -2) --Returns 900.00

  --Round the last 1 place before (to the left) the decimal point
  SELECT ROUND(850.556, -1) --Returns 850.000

  /*
  ##  – Mathematical Functions Interview Questions

1. What are Mathematical Functions in SQL Server?
2. What is the purpose of the ABS() function?
3. What is the syntax of the ABS() function?
4. What does the ABS() function return?
5. What is the difference between CEILING() and FLOOR()?
6. What is the syntax of the CEILING() function?
7. What is the syntax of the FLOOR() function?
8. What is the output of CEILING(15.2)?
9. What is the output of FLOOR(15.2)?
10. What is the output of CEILING(-15.2)?
11. What is the output of FLOOR(-15.2)?
12. What is the POWER() function?
13. What is the syntax of the POWER() function?
14. What is the output of POWER(2,3)?
15. What is the purpose of the SQUARE() function?
16. What is the purpose of the SQRT() function?
17. What is the difference between SQUARE() and SQRT()?
18. What is the output of SQUARE(9)?
19. What is the output of SQRT(81)?
20. What is the RAND() function?
21. What is the range of values returned by RAND()?
22. What is the purpose of the seed value in the RAND() function?
23. Why does RAND(1) always return the same value?
24. How do you generate a random number between 1 and 100?
25. How do you generate multiple random numbers using a WHILE loop?
26. What is the ROUND() function?
27. What is the syntax of the ROUND() function?
28. What is the purpose of the length parameter in ROUND()?
29. What is the purpose of the optional function parameter in ROUND()?
30. What is the difference between rounding and truncation?
31. What is the output of ROUND(850.556, 2)?
32. What is the output of ROUND(850.556, 2, 1)?
33. What is the output of ROUND(850.556, 1)?
34. What is the output of ROUND(850.556, 1, 1)?
35. What is the output of ROUND(850.556, -1)?
36. What is the output of ROUND(850.556, -2)?
37. What is the difference between positive and negative values of the length parameter in ROUND()?
38. Can ROUND() be used to round values before the decimal point?
39. What is the difference between ABS(), CEILING(), and FLOOR()?
40. Explain a real-time scenario where SQL Server Mathematical Functions are used.

*/