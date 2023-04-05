use AdventureWorks2012
select *
from [HumanResources].[Employee]


select[Gender],[JobTitle],[VacationHours],[SickLeaveHours]
from [HumanResources].[Employee]
where [VacationHours] > 20
order by [VacationHours] DESC

SELECT [Name],[Color],[Style]
FROM[Production].[Product]
WHERE[Color] IS NOT NULL

SELECT TOP 50[Name],[Color],[ListPrice] 
FROM[Production].[Product]
ORDER BY [ListPrice] DESC



--- DATE MANIPULATION---
SELECT [BusinessEntityID],[JobTitle],[Gender],[HireDate]
FROM [HumanResources].[Employee]

SELECT [BusinessEntityID],[JobTitle],[Gender],DAY([HireDate]) AS 'DAY OF HIRE'
FROM [HumanResources].[Employee]

SELECT [BusinessEntityID],[JobTitle],[Gender],MONTH([HireDate]) AS 'MONTH OF HIRE'
FROM [HumanResources].[Employee]

SELECT [BusinessEntityID],[JobTitle],[Gender],YEAR([HireDate]) AS 'YEAR OF HIRE'
FROM [HumanResources].[Employee]
ORDER BY YEAR([HireDate]) ASC

--DATENAME--
SELECT [BusinessEntityID],[JobTitle],[Gender],DATENAME( MONTH, [HireDate]) AS 'MONTHNAME'
FROM [HumanResources].[Employee]

--WEEKDAY--
SELECT [BusinessEntityID],[JobTitle],[Gender],[MaritalStatus],DATENAME( WEEKDAY, [HireDate]) AS 'DAY OF HIRE'
FROM [HumanResources].[Employee]

---GETDATE, DATEDIFF--
SELECT [BusinessEntityID],[JobTitle], GETDATE () 'TODAYs DATE'
FROM [HumanResources].[Employee]

SELECT [BusinessEntityID],[JobTitle],[Gender],[MaritalStatus],DATEDIFF(YY,[BirthDate], GETDATE ()) AS 'AGE'
FROM [HumanResources].[Employee]
ORDER BY 'AGE' DESC

SELECT [BusinessEntityID],[JobTitle],[Gender],[MaritalStatus],DATEDIFF(YY,[HireDate], GETDATE ()) AS 'YEAR OF SERVICE'
FROM [HumanResources].[Employee]
ORDER BY 'YEAR OF SERVICE' DESC

--CASE--
SELECT [BusinessEntityID],[JobTitle],[Gender],[MaritalStatus],DATEDIFF(YY,[HireDate], GETDATE ()) AS 'YEAR OF SERVICE',
CASE
WHEN DATEDIFF(YY, [HireDate], GETDATE ()) <=10
THEN 'ENTRY LEVEL'
WHEN DATEDIFF(YY, [HireDate], GETDATE ()) BETWEEN 11 AND 15
THEN 'MID LEVEL'
WHEN DATEDIFF(YY, [HireDate], GETDATE ()) BETWEEN 16 AND 25
THEN 'SENIOR LEVEL'
ELSE 'DIRECTOR'
END
AS 'SERVICE LEVEL'
FROM [HumanResources].[Employee] 
ORDER BY 'YEAR OF SERVICE'


SELECT [BusinessEntityID],[JobTitle],[Gender],[MaritalStatus],DATEDIFF(YY,[BirthDate], GETDATE ()) AS 'AGE',
CASE
WHEN DATEDIFF(YY,[BirthDate], GETDATE ()) <=30
THEN 'YOUNG'
WHEN DATEDIFF(YY,[BirthDate], GETDATE ()) BETWEEN 31 AND 45
THEN 'ADULT'
WHEN DATEDIFF(YY,[BirthDate], GETDATE ()) BETWEEN 46 AND 70
THEN 'OLD'
ELSE 'RETIRED'
END
AS 'AGE RANGE'
FROM [HumanResources].[Employee]
ORDER BY 'AGE' DESC

SELECT[BusinessEntityID],[FirstName],[LastName], CONCAT([FirstName], ' ', [LastName]) AS 'FULL NAME'
FROM [Person].[Person]

--LIKE--
SELECT *
FROM [Person].[Person]

SELECT *
FROM [Person].[Person]
WHERE [LastName] LIKE ('%A')

SELECT *
FROM [Person].[Person]
WHERE [LastName] LIKE ('G%')

SELECT *
FROM [Person].[Person]
WHERE [LastName] LIKE ('-G%')

SELECT *
FROM [Person].[Person]
WHERE [LastName] LIKE ('-G%')

-- Joins--
-- Left join, right join, inner join--
select HRE.[BusinessEntityID], HRE.[JobTitle], HRE.[Gender], PP.[BusinessEntityID], PP.[FirstName], PP.[LastName]
FROM [HumanResources].[Employee] AS HRE
LEFT JOIN [Person].[Person] AS PP
ON HRE.[BusinessEntityID] = PP. [BusinessEntityID]
select HRE.[BusinessEntityID], HRE.[JobTitle], HRE.[Gender], PP.[BusinessEntityID], PP.[FirstName], PP.[LastName]
FROM [HumanResources].[Employee] AS HRE
RIGHT JOIN [Person].[Person] AS PP
ON HRE.[BusinessEntityID] = PP. [BusinessEntityID]
WHERE [JobTitle] IS NOT NULL

SELECT PRO.[ProductID], PRO.[Name], PRO. [Color], SOD. [OrderQty], SOD. [UnitPrice]
FROM [Production].[Product] AS PRO
LEFT JOIN [Sales].[SalesOrderDetail] AS SOD
ON PRO.[ProductID] = SOD. [OrderQty]

SELECT SOD.[SalesOrderID], SOD.[OrderQty], SOD.[UnitPrice], SOH.[SalesOrderID], SOH.[SalesOrderNumber]
FROM [Sales].[SalesOrderDetail] AS SOD
INNER JOIN [Sales].[SalesOrderHeader] AS SOH
ON SOD.[SalesOrderID] = SOH.[SalesOrderID]

-- CREATING DATABASE--
CREATE DATABASE CODESCHOOLAFRICA_DAF_AUGUSTCOHORT
