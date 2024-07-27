## How many shipments (sales) where amounts are > 2,000 and boxes are <100 each of the sales persons had in 2022?

select p.Salesperson, Amount, SaleDate, Boxes, 
month(SaleDate) as 'Month' from sales s 
left join people p on p.SPID=s.SPID
where year(SaleDate) = 2022 
and Amount between 100 and 2000;


## What are the names of salespersons who had at least one shipment (sale) in the first 7 days of January 2022?

select p.Salesperson, sum(s.Amount) TotalBoxes from sales s
left join people p on p.SPID=s.SPID
where s.Amount>=1 
and s.SaleDate between '2022-01-01' and '2022-01-07'
group by p.Salesperson
order by TotalBoxes desc;


## How many times we shipped more than 1,000 boxes in each month?

select year(SaleDate) Year, month(SaleDate) Month, count(*) as Above1000 from sales
where Boxes>=1000 
group by year(SaleDate), month(SaleDate)
order by Year, Month desc;


## How many shipments (sales) each of the sales persons had in the month of January 2022?

select Amount, SaleDate, Boxes, 
month(SaleDate) as 'Month' 
from sales 
where year(SaleDate) = 2022 and month(SaleDate)=1;