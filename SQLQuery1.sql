select *
from Project_Sales_Data..Sales_Data$


--standardize Date Format

select [Order Date], CONVERT (Date, [Order Date])
from Project_Sales_Data..Sales_Data$ 

UPDATE Sales_Data$
SET [Order Date] = CONVERT (Date, [Order Date])

---it does not work so I have thried another way Date Format

ALTER TABLE Sales_Data$
Add Order_Date DATE

UPDATE Sales_Data$
SET Order_Date = CONVERT (Date, [Order Date])


--Create column Order_Month for tracking Seasonality / ipsitati jos jednom sta je radilo od ovog

ALTER TABLE Sales_Data$
ADD  Order_Month AS DATEPART(MM,Order_Date) PERSISTED

UPDATE Sales_Data$
SET Order_Month = CONVERT (date, Order_Date)

--
DROP TABLE IF EXISTS dbo.Temp;
CREATE TABLE dbo.Temp
(
   Temp_ID TINYINT IDENTITY(1,1) NOT NULL PRIMARY KEY,
   TempDate DATE NOT NULL DEFAULT GETDATE()
)
GO

INSERT dbo.Temp(TempDate)
   VALUES(GETDATE()),('20120430');
 GO

ALTER TABLE dbo.Temp
ADD  TempMonth AS DATEPART(MM,Tempdate) PERSISTED
GO

SELECT * FROM dbo.Temp;

-- Seasonalities by month

select Order_month, sum(round([Total Sale Amount],2)) as Total_Sales_by_Month
from Project_Sales_Data..Sales_Data$
group by Order_month
order by Total_Sales_by_Month desc

select *
from Project_Sales_Data..Sales_Data$

select [Sales Representative], Location, Order_Date, Item ,count(Customer) as Numbers_of_customers ,sum(round([Total Sale Amount],2)) as Total_Sales
from Project_Sales_Data..Sales_Data$
group by [Sales Representative], Location, Item, Order_Date

select item, sum(round([Total Sale Amount],2))
from Project_Sales_Data..Sales_Data$
group by Item