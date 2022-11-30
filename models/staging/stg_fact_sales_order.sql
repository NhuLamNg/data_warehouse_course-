with model as (
select
  *
from `vit-lam-data.wide_world_importers.sales__orders`
)
, a_name as (
  select
    order_id as sales_order_key
  ,customer_id as customer_key
  from model
)
,b_type as (
  select
  cast(sales_order_key as integer ) as sales_order_key
  ,cast(customer_key as integer) as customer_key
  from a_name
)
select * from b_type


 