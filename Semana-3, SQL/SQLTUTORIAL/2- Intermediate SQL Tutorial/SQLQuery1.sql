

-- Intermediate SQL Tutorial | Unions | Union Operator

--////////// 1
--SELECT * 
--FROM SQLTUTORIAL.dbo.EmployeeDemographics
--UNION
--SELECT *
--FROM SQLTUTORIAL.dbo.WareHouseEmployeeDemographics


--////////// 2
--SELECT * 
--FROM SQLTUTORIAL.dbo.EmployeeDemographics
--UNION ALL
--SELECT *
--FROM SQLTUTORIAL.dbo.WareHouseEmployeeDemographics
--ORDER BY EmployeeID

--/////////// 3
--SELECT EmployeeID, FirstName, Age
--FROM SQLTUTORIAL.dbo.EmployeeDemographics
--UNION
--SELECT EmployeeID, JobTitle, Salary
--FROM SQLTUTORIAL.dbo.EmployeeSalary
--ORDER BY EmployeeID






-- Intermediate SQL Tutorial | Case Statement | Use Cases

--SELECT FirstName, LastName, Age,
--CASE
--	WHEN Age = 38 then 'Stanley'
--    WHEN Age > 30 THEN 'Old'
--	else 'Baby'
--END
--from SQLTUTORIAL.dbo.EmployeeDemographics
--where Age is NOT NULL
--order by Age



--select FirstName, LastName, JobTitle, Salary,
--case 
--    when JobTitle = 'Salesman' then Salary + (Salary * .10)
--	when JobTitle = 'Accountant' then Salary + (Salary * .05)
--	when JobTitle = 'HR' then Salary + (Salary * .000001)
--	else Salary + (Salary + .03)
--end as SalaryAfterRaise
--from SQLTUTORIAL.dbo.EmployeeDemographics
--join SQLTUTORIAL.dbo.EmployeeSalary
--    on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID






-- Intermediate SQL Tutorial | Having Clause

-- JobTitles that have an average salary of over 45000
--select JobTitle, avg(Salary)
--from SQLTUTORIAL.dbo.EmployeeDemographics
--join SQLTUTORIAL.dbo.EmployeeSalary
--    on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--group by JobTitle
--having avg(Salary) > 45000
--order by AVG(Salary);





-- Intermediate SQL Tutorial | Updating/Deleting Data



--select * 
--from SQLTUTORIAL.dbo.EmployeeDemographics

-- UPDATING DATA:

-- 1
--update SQLTUTORIAL.dbo.EmployeeDemographics
--SET EmployeeID = 1012
--Where FirstName = 'Holly' AND LastName = 'Flax'


-- 2
--update SQLTUTORIAL.dbo.EmployeeDemographics
--SET Age = 31, Gender = 'Female'
--Where FirstName = 'Holly' AND LastName = 'Flax'



-- DELETING DATA:

-- 1: usar siempre un select para corroborar que informacion vas a eliminar...

--select *
--delete
--from SQLTUTORIAL.dbo.EmployeeDemographics
--where EmployeeID = 1004;






---- Intermediate SQL Tutorial | Aliasing

--- 1

--select FirstName + ' ' + LastName as FullName
--from SQLTUTORIAL.dbo.EmployeeDemographics

--2

--select avg(Age) AS AvgAge
--from SQLTUTORIAL.dbo.EmployeeDemographics

-- 3

--select Demo.EmployeeID, Sal.Salary
--from SQLTUTORIAL.dbo.EmployeeDemographics as Demo
--join SQLTUTORIAL.dbo.EmployeeSalary as Sal
--     on Demo.EmployeeID = Sal.EmployeeID



---- Intermediate SQL Tutorial | Partition By

-- 1

--select FirstName, LastName, Gender, Salary
--, COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender
--from SQLTUTORIAL.dbo.EmployeeDemographics DEM
--join SQLTUTORIAL.dbo.EmployeeSalary SAL
--    on DEM.EmployeeID = SAL.EmployeeID




-- BECAUSE OF THIS ON GROUP BY...

--SELECT Gender, COUNT(Gender)
--FROM SQLTUTORIAL.dbo.EmployeeDemographics DEM
--JOIN SQLTUTORIAL.dbo.EmployeeSalary SAL
--     ON DEM.EmployeeID = SAL.EmployeeID
--GROUP BY Gender