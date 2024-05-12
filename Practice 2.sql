
## 1.What are the names of salespersons who had at least one shipment (sale) in the first 7 days of January 2022?

select p.Salesperson, sum(s.Amount) TotalBoxes from sales s
left join people p on p.SPID=s.SPID
where s.Amount>=1 
and s.SaleDate between '2022-01-01' and '2022-01-07'
group by p.Salesperson
order by TotalBoxes desc;
#--------------------------------------------------------------------------------------------

## 2.Which salespersons did not make any shipments in the first 7 days of January 2022?
 
select p.Salesperson, sum(s.Amount) TotalBoxes from sales s
left join people p on p.SPID=s.SPID
where s.Amount=0 
and s.SaleDate between '2022-01-01' and '2022-01-07'
group by p.Salesperson
order by TotalBoxes desc;
#--------------------------------------------------------------------------------------------

## 3.How many times we shipped more than 1,000 boxes in each month?

select year(SaleDate) Year, month(SaleDate) Month, count(*) as Above1000 from sales
where Boxes>=1000 
group by year(SaleDate), month(SaleDate)
order by Year, Month desc;
#--------------------------------------------------------------------------------------------

## 4.Did we ship at least one box of ‘After Nines’ to ‘New Zealand’ on all the months?

select g.Geo, year(s.SaleDate) Year, month(s.SaleDate) Month, day(s.SaleDate) day
from sales s left join geo g on g.GeoID=s.GeoID
where s.Boxes>=1 and day(s.SaleDate)>=9 and Geo='New Zealand'
group by year(s.SaleDate), month(s.SaleDate), day(s.SaleDate)
order by Year, Month, day;

#Option 2___________________________________________
set @product_name = 'After Nines';
set @country_name = 'New Zealand';

select year(s.SaleDate) Year, month(s.SaleDate) Month,
if(sum(boxes)>1, 'Yes','No') Status
from sales s
join products pr on pr.PID = s.PID
join geo g on g.GeoID=s.GeoID
where pr.Product = @product_name and g.Geo = @country_name
group by year(SaleDate), month(SaleDate)
order by year(SaleDate), month(SaleDate);
#--------------------------------------------------------------------------------------------

## 5.India or Australia? Who buys more chocolate boxes on a monthly basis?

select g.Geo, year(s.SaleDate) Year, month(s.SaleDate) Month, sum(s.Boxes)
from sales s left join geo g on g.GeoID=s.GeoID
where Geo='India' or Geo='Australia'
group by year(s.SaleDate), month(s.SaleDate), g.Geo
order by Year, Month;

#Option 2_________________________________
select year(SaleDate) 'Year', month(SaleDate) 'Month',
sum(case when g.geo='India' = 1 then boxes else 0 end) 'India Boxes',
sum(case when g.geo='Australia' = 1 then boxes else 0 end) 'Australia Boxes'
from sales s
join geo g on g.GeoID=s.GeoID
group by year(SaleDate), month(SaleDate)
order by year(SaleDate), month(SaleDate);