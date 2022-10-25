# Project_Sale

In Project_Sale in SQl following queries were made: 

1. Date format was changed from date with timestamp to yyyy-mm-dd, because timestamp was not necessary for data exploration, all were with stamp 00:00:00.
2. Table was updated and new date collums added
3. Collumn order_month was added for purpose of tracking seasonality in sales
4. Next, total sales per month was queried 
5. Total sales per sale item was queried

After SQL results were exported to Excel (file :"Queried_sales_data_for_Tableu") and from Excel imported into Tableau

In Tableu one pie chart, one line chart and one map were created :
1.Line char shows sale by quartal and month of 2016;
2.Pie chart shows sale by item of sale or sale article;
3.Map shows sale by territory, with countries shaded by sale numbers 

Dashboard has 2 filter actions, one that runs on select and another running on hover, both action taget filters on pie chart.
