-- Problem Statement


use AdventureWorks2019;

select 
P.Name as ProuctName,
P.ListPrice,
PS.Name As ProductSubcategory,
PC.Name As ProuctCategory,
avg(P.ListPrice) over(Partition by PC.Name) AvgPriceByCategory,
avg(P.ListPrice) over(Partition by PC.name,PS.Name) AvgPriceByCategoryAndSubCategory,
P.ListPrice-avg(P.ListPrice) over(Partition by PC.Name) ProductVsCategoryDelta
from Production.Product P
inner join Production.ProductSubcategory PS on PS.ProductSubcategoryID=P.ProductSubcategoryID
inner join Production.ProductCategory PC on PS.ProductCategoryID=PC.ProductCategoryID
