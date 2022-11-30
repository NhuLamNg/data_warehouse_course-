
with dim_supplier__source  as (
  select *
  from `vit-lam-data.wide_world_importers.purchasing__suppliers`
)

,dim_supplier_rename__column as(
  SELECT 
    supplier_id as supplier_key
    ,supplier_name as supplier_name
  FROM dim_supplier__source ) 

,dim_supplier__cast_type as (
  select
      cast(supplier_key as integer) as supplier_key
      ,cast(supplier_name as string) as supplier_name
  from dim_supplier_rename__column
)

select 
  supplier_key
  ,supplier_name 
from dim_supplier__cast_type
