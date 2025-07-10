-- Checking for null values
SELECT * 
FROM "BRIGHT"."COFFEE"."SHOP"
WHERE transaction_id IS NULL OR
transaction_date IS NULL 
OR transaction_time IS NULL OR store_id IS NULL OR transaction_qty IS NULL OR Store_location IS NULL 
OR product_id IS NULL OR product_category IS NULL OR product_type IS NULL OR product_detail IS NULL OR unit_price IS NULL; --no null value

---count unique product id
select distinct count (product_id) as unique_product-id 
  from"BRIGHT"."COFFEE"."SHOP";

  ---how many customer do we have
  select distinct count(transaction_id)as number_of_rows
  from"BRIGHT"."COFFEE"."SHOP";

  ---transaction count per store 
  select store_location,count(transaction_id)as number_of_transaction 
  from"BRIGHT"."COFFEE"."SHOP"
  group by store_location;---- done

--time min
  select min(transaction_time) as min_time
  from "BRIGHT"."COFFEE"."SHOP";
  --time max
  select max(transaction_time) as min_time
  from "BRIGHT"."COFFEE"."SHOP"; 
  
  ---time  case statement
  select sum(transaction_qty*unit_price), count(transaction_id), case 
  when transaction_time between '06:00:00' and '11:59:59' then 'morning'
  when transaction_time between '12:00:00' and '16:59:59' then 'afternoon'
  when transaction_time between '17:00:00' and '19:59:59' then 'everning'
  else 'night'
  end as time_basket
  from "BRIGHT"."COFFEE"."SHOP"
  group by all;

  --date mon_sun
  select dayname(to_date(transaction_date)) as day_of_the_week 
 from "BRIGHT"."COFFEE"."SHOP";

 --month jan to june
    select store_location, sum(transaction_qty*unit_price) as revenue, monthname(to_date(transaction_date)) as month_names 
 from "BRIGHT"."COFFEE"."SHOP"
 group by all 
 order by revenue desc;

 ---month id
select to_char(to_date(transaction_date),'yyyymm') as month_id
from bright.coffee.shop;

---total revenue
select sum(transaction_qty*unit_price) as revenue
from  "BRIGHT"."COFFEE"."SHOP";

--cheapest product
select product_category,product_detail,product_type,min(unit_price) as cheapest_product 
from  "BRIGHT"."COFFEE"."SHOP"
group by all
order by cheapest_product asc;

--expensive product
select product_category,product_detail,product_type,max(unit_price) as expensive_product 
from  "BRIGHT"."COFFEE"."SHOP"
group by all
order by cheapest_product desc;

--quantity sold
select sum(transaction_qty) quantity_sold
from "BRIGHT"."COFFEE"."SHOP";


---magic starts here 
select
      count(transaction_id)as number_of_transaction,
      count(product_id) as product_sold,
      sum(transaction_qty*unit_price) as revenue,
      sum(transaction_qty)as quantity_sold,
      store_location,
      product_id,
      product_category,
    product_detail,
    product_type,
    unit_price,
   to_char(to_date(transaction_date),'yyyymm') as month_id,
   monthname(to_date(transaction_date)) as month_names,
   dayname(to_date(transaction_date)) as day_of_the_week,
    ,case 
  when transaction_time between '06:00:00' and '11:59:59' then 'morning'
  when transaction_time between '12:00:00' and '16:59:59' then 'afternoon'
  when transaction_time between '17:00:00' and '19:59:59' then 'everning'
  else 'night'
  end as time_basket
  from bright.coffee.shop
  group by all
  order by revenue desc;
