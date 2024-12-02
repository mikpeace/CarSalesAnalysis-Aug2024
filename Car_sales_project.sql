-- Top 5 car makers by market share in aug'24 

Select Top 5 Name, [MarketShare_aug'24_%]
From [car_sales]
Order By [MarketShare_aug'24_%] Desc;



-- Calculate avg YoY growth percent

Select Avg([YoY_growth_%]) AS Avg_YoY_growth
From car_sales;



-- Update the wronged entered data in MarketShare_diff_% column

Update car_sales 
Set [MarketShare_diff_%] = -2.9
Where Name = 'Maruti Suzuki';



-- Identify car makers with an increase market share over a year

Select Name, [MarketShare_diff_%]
From car_sales
Where [MarketShare_diff_%] > 0
Order By [MarketShare_diff_%] Desc;



-- List car makers with a month over month growth percent greater than 2%

Select Name, [MoM_growth_%]
From car_sales
Where [MoM_growth_%] > 2.0
Order By [MoM_growth_%] Desc;



-- Find total units sold in month of July'24 & August'24

Select Sum ([MoM_sales_july'24]) As [UnitSold_july'24]
From car_sales;

Select Sum ([MoM_sales_aug'24]) As [UnitSold_aug'24]
From car_sales;



-- Difference between total sales in july'24 & aug'24

Select 
(Select Sum ([MoM_sales_aug'24]) As [UnitSold_july'24]
From car_sales) -

(Select Sum ([MoM_sales_july'24]) As [UnitSold_aug'24]
From car_sales) 
As UnitSold_difference;



-- Total units sold by each car maker in august'23 and august'24

Select Sum ([YoY_sales_aug'23]) As [UnitSold_aug'23]
From car_sales;

Select Sum ([YoY_sales_aug'24]) As [UnitSold_aug'24]
From car_sales;



-- Top 5 car makers and bottom 5 car makers according to the units sold in aug'23 & aug'24

SELECT TOP 5  Name, [YoY_sales_aug'24] 
FROM car_sales
ORDER BY [YoY_sales_aug'24] Desc;

SELECT TOP 5  Name, [YoY_sales_aug'24] 
FROM car_sales
ORDER BY [YoY_sales_aug'24] Asc;


Select Top 5 Name, [YoY_sales_aug'23]
From car_sales
Order By [YoY_sales_aug'23] Desc;

Select Top 5 Name, [YoY_sales_aug'23] 
From car_sales
Order By [YoY_sales_aug'23] Asc;



-- Sum of total units sold by top 5 and bottom 5 car makers

With Bottom_5_makers As 
(	Select Top 5  Name, Sum ([YoY_sales_aug'24]) As Units_sold
	From car_sales
	Group By Name
	Order By Sum ([YoY_sales_aug'24]) Asc	
)
Select Sum (Units_sold) As Bottom_5_total_sales
From Bottom_5_makers;


With Top_5_makers As 
(	Select Top 5  Name, Sum ([YoY_sales_aug'24]) As Units_sold
	From car_sales
	Group By Name
	Order By Sum ([YoY_sales_aug'24]) Desc	
)
Select Sum (Units_sold) As Top_5_total_sales
From Top_5_makers;

