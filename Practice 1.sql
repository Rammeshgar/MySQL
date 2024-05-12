
#-#Print details of shipments (sales) where amounts are > 2,000 and boxes are <100?

select * from sales
where Amount between 100 and 2000;


#-# How many shipments (sales) each of the sales persons had in the month of January 2022?

select Amount, SaleDate, Boxes, 
month(SaleDate) as 'Month' 
from sales 
where year(SaleDate) = 2022 and month(SaleDate)=1;


#-# Which product sells more boxes? Milk Bars or Eclairs?

select p.Product, sum(s.Boxes) TotalBoxes from products p
join sales s on s.PID=p.PID
where p.Product in ('Milk Bars','Eclairs')
group by p.Product
order by TotalBoxes desc;


#-# Which product sold more boxes in the first 7 days of February 2022? Milk Bars or Eclairs?

select p.Product, sum(s.Boxes) TotalBoxes from sales s
left join products p on p.PID=s.PID
where p.Product in ('Milk Bars','Eclairs') 
and s.SaleDate between '2022-02-01' and '2022-02-07'
group by p.Product
order by TotalBoxes desc
limit 1;


#-# Which shipments had under 100 customers & under 100 boxes? Did any of them occur on Wednesday?

select p.Product, s.SaleDate, s.Customers ,s.Boxes from sales s
left join products p on p.PID=s.PID
where s.Customers<100 and s.Boxes<100 and weekday(SaleDate)=3;

