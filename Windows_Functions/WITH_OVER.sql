-- Problem Statement

use AdventureWorks2019;

-- Use of aggregate function with over
select 
P.FirstName,
P.LastName,
E.JobTitle,
EPH.Rate,
AVG(EPH.Rate) over() As AverageRate,
Max(EPH.Rate) over() As MaximumRate,
EPH.Rate-AVG(EPH.Rate) over() As DiffFromAvgRate,
EPH.Rate/Max(EPH.Rate) over() As PercentOfMaxRate
from Person.Person P
inner join HumanResources.Employee E on P.BusinessEntityID=E.BusinessEntityID
inner join HumanResources.EmployeePayHistory EPH on EPH.BusinessEntityID=P.BusinessEntityID