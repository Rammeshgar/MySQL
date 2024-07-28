## MySQL and Power BI Integration Project.
## Overview
### This project aims to integrate Awesome chocolates data from a MySQL database into Power BI for insightful visualizations and analysis.

[Awesome chocolates.pdf](https://github.com/user-attachments/files/16401666/Awesome.chocolates.pdf)

<img width="575" alt="Screenshot Awesome chocolates" src="https://github.com/user-attachments/assets/54a5dd82-602c-4260-8218-639345cfa6bc">

## MySQL Data Extraction
### To find shipments where amounts are greater than 100 and less than 2000 for each salesperson in 2022

{select p.Salesperson, Amount, SaleDate, Boxes, 
month(SaleDate) as 'Month' from sales s 
left join people p on p.SPID=s.SPID
where year(SaleDate) = 2022 
and Amount between 100 and 2000;}

### To determine how many times you shipped more than 1,000 boxes each month

{select year(SaleDate) Year, month(SaleDate) Month, count(*) as Above1000 from sales
where Boxes>=1000 
group by year(SaleDate), month(SaleDate)
order by Year, Month desc;}

### To calculate the total shipments for each salesperson in January 2022

{select Amount, SaleDate, Boxes, 
month(SaleDate) as 'Month' 
from sales 
where year(SaleDate) = 2022 and month(SaleDate)=1;}

## Visualization
### Design meaningful and easy to understand visualizations using Power BI’s drag-and-drop interface.
### Create interactive charts, graphs, and table to represent the insights from The data.
