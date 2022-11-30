with fact_sale_order as (
  select
    *
  from
    `vit-lam-data.wide_world_importers.sales__order_lines`
),
fact_sale_name_column as (
  SELECT
    order_line_id AS sales_order_line_key,
    quantity as quantity,
    unit_price as unit_price,
    quantity * unit_price as gross_amount,
    stock_item_id as product_key
  FROM
    fact_sale_order
),
fact_sale_cast_type as (
  select
    cast(sales_order_line_key as integer) as sales_order_line_key,
    cast(quantity as integer) as quantity,
    cast(unit_price as numeric) as unit_price,
    cast(quantity as integer) * cast(unit_price as numeric) as gross_amount,
    cast (product_key as integer) as product_key
  from
    fact_sale_name_column
)
,final as(
select
  *
from
  fact_sale_cast_type
)
select 
  a.*
  ,b.*
from final a
left join {{ ref('stg_fact_sales_order')}} b
on a.sales_order_line_key = b.sale_order_key