/*

Today's Topic: String Functions - TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower

*/

--Drop Table EmployeeErrors;


--CREATE TABLE EmployeeErrors (
--EmployeeID varchar(50)
--,FirstName varchar(50)
--,LastName varchar(50)
--)

--Insert into EmployeeErrors Values 
--('1001  ', 'Jimbo', 'Halbert')
--,('  1002', 'Pamela', 'Beasely')
--,('1005', 'TOby', 'Flenderson - Fired')

--Select *
--From EmployeeErrors;




--//////// Using Trim, LTRIM, RTRIM

--Select EmployeeID, TRIM(EmployeeID) as IDTRIM
--FROM EmployeeErrors;

--Select EmployeeID, LTRIM(EmployeeID) as IDTRIM
--FROM EmployeeErrors;

--Select EmployeeID, RTRIM(EmployeeID) as IDTRIM
--FROM EmployeeErrors;


-- /////////// Using Replace


--SELECT LastName, REPLACE(LastName, '- Fired','') as LastNameFixed
--FROM EmployeeErrors;

-- /////////////// Using Substring

--1
--Select SUBSTRING(FirstName,3,3)
--from EmployeeErrors;

--2
--Select substring(err.FirstName,1,3), substring(dem.FirstName,1,3)
--from SQLTUTORIAL.dbo.EmployeeErrors err
--join SQLTUTORIAL.dbo.EmployeeDemographics dem
--     on substring(err.FirstName,1,3) = substring(dem.FirstName,1,3);

-- //////////// Using UPPER and  LOWER

--Select FirstName, LOWER(FirstName)
--FROM EmployeeErrors;


--Select FirstName, UPPER(FirstName)
--FROM EmployeeErrors;



-- /////////////// Stored PROCEDURES + Use Cases

--CREATE PROCEDURE Temp_Employee
--AS
--DROP TABLE IF EXISTS #temp_employee
--Create table #temp_employee (
--JobTitle varchar(100),
--EmployeesPerJob int ,
--AvgAge int,
--AvgSalary int
--)


--Insert into #Temp_Employee
--SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
--FROM SQLTutorial..EmployeeDemographics emp
--JOIN SQLTutorial..EmployeeSalary sal
--	ON emp.EmployeeID = sal.EmployeeID
--group by JobTitle

--Select * 
--From #temp_employee
--GO;




--CREATE PROCEDURE Temp_Employee2 
--@JobTitle nvarchar(100)
--AS
--DROP TABLE IF EXISTS #temp_employee3
--Create table #temp_employee3 (
--JobTitle varchar(100),
--EmployeesPerJob int ,
--AvgAge int,
--AvgSalary int
--)


--Insert into #temp_employee3
--SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
--FROM SQLTutorial..EmployeeDemographics emp
--JOIN SQLTutorial..EmployeeSalary sal
--	ON emp.EmployeeID = sal.EmployeeID
--where JobTitle = @JobTitle --- make sure to change this in this script from original above
--group by JobTitle

--Select * 
--From #temp_employee3
--GO;

--INSERT INTO #temp_employee
--SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(salary)
--FROM SQLTUTORIAL..EmployeeDemographics emp
--JOIN SQLTUTORIAL..EmployeeSalary sal
--    ON emp.EmployeeID = sal.EmployeeID
--group by JobTitle;

--Select * FROM #temp_employee



-- ///////////// Advanced SQL Tutorial | Subquerie



-- Subquery in Select

--Select EmployeeID, Salary, (Select AVG(Salary) From EmployeeSalary) as AllAvgSalary
--From EmployeeSalary

-- How to do it with Partition By

--Select EmployeeID, Salary, AVG(Salary) over () as AllAvgSalary
--From EmployeeSalary


-- Why Group By doesn't work

--Select EmployeeID,Salary, AVG(Salary) as AllAvgSalary
--From EmployeeSalary 
--Group By EmployeeID, Salary   
--Order By 1,2


-- Subquery in From

--Select a.EmployeeID, a.AllAvgSalary
--From (Select EmployeeID, Salary, AVG(Salary) over () as AllAvgSalary
--      From EmployeeSalary) a


-- Subquery in Where

--Select EmployeeID, JobTitle, Salary 
--From EmployeeSalary 
--Where EmployeeID in (
--               Select EmployeeID
--			   From EmployeeDemographics
--			   Where Age > 30)