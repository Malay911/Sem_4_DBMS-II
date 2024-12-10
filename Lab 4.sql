--Note: for Table valued function use tables of Lab-2
 -----------------------------------------------Part-A-------------------------------------------------
--1. Write a function to print "hello world".
CREATE OR ALTER FUNCTION FR_HELLOWORLD()
	RETURNS VARCHAR(100)
AS
BEGIN
	RETURN 'HELLO WORLD';
END

SELECT DBO.FR_HELLOWORLD();

--2. Write a function which returns addition of two numbers.
CREATE OR ALTER FUNCTION FR_ADDTWONUMBERS(@NUM1 INT,@NUM2 INT)
	RETURNS INT
AS
BEGIN
	RETURN @NUM1+@NUM2;
END

SELECT DBO.FR_ADDTWONUMBERS(4,5);

--3. Write a function to check whether the given number is ODD or EVEN.
CREATE OR ALTER FUNCTION FR_EVENORODD(@NUM INT)
	RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @RESULT VARCHAR(10)
	IF @NUM%2=0
		SET @RESULT='EVEN'
	ELSE
		SET @RESULT='ODD'
	RETURN @RESULT
END

SELECT DBO.FR_EVENORODD(7);

--4. Write a function which returns a table with details of a person whose first name starts with B.
CREATE OR ALTER FUNCTION FR_PERSON_FIRSTNAMEWITHB()
	RETURNS TABLE
AS
	RETURN(SELECT * FROM PERSON WHERE FIRSTNAME LIKE 'B%');

SELECT * FROM FR_PERSON_FIRSTNAMEWITHB();

--5. Write a function which returns a table with unique first names from the person table.
CREATE OR ALTER FUNCTION FR_PERSON_UNIQUENAME()
	RETURNS TABLE
AS
	RETURN(SELECT DISTINCT FIRSTNAME FROM PERSON);

SELECT * FROM FR_PERSON_UNIQUENAME();

--6. Write a function to print number from 1 to N. (Using while loop)
CREATE OR ALTER FUNCTION FR_PRINT1TONNUMBERS(@NUM INT)
	RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @I INT=1
	DECLARE @N VARCHAR(100)='';
	WHILE @I<=@NUM
		BEGIN
			SET @N=@N+CAST(@I AS VARCHAR)+' '
			SET @I=@I+1
		END
	RETURN @N
END 

SELECT DBO.FR_PRINT1TONNUMBERS(5);

--7. Write a function to find the factorial of a given integer.
CREATE OR ALTER FUNCTION FR_FACTORIAL(@NUM INT)
	RETURNS INT
AS
BEGIN
	DECLARE @FAC INT=1;
	DECLARE @I INT=1;
	WHILE @I<=@NUM
		BEGIN
			SET @FAC=@FAC*@I
			SET @I=@I+1;
		END
	RETURN @FAC
END

SELECT DBO.FR_FACTORIAL(5);

 -----------------------------------------------Part-B-------------------------------------------------
--8. Write a function to compare two integers and return the comparison result. (Using Case statement)

--9. Write a function to print the sum of even numbers between 1 to 20.
--10. Write a function that checks if a given string is a palindrome
 -----------------------------------------------Part-C-------------------------------------------------
--11. Write a function to check whether a given number is prime or not.
--12. Write a function which accepts two parameters start date & end date, and returns a difference in days.
--13. Write a function which accepts two parameters year & month in integer and returns total days each year.
--14. Write a function which accepts departmentID as a parameter & returns a detail of the persons.
--15. Write a function that returns a table with details of all persons who joined after 1-1-1991.