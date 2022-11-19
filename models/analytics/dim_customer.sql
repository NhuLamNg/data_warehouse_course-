WITH
  customer AS (
  SELECT
    *
  FROM
    `vit-lam-data.wide_world_importers.sales__customers` ),
  customer_change_name AS (
  SELECT
    customer_id AS customer_key,
    customer_name AS customer_name
  FROM
    customer ),
  customer_type AS(
  SELECT
    CAST(customer_key AS integer) AS customer_key,
    CAST(customer_name AS string) AS customer_name
  FROM
    customer_change_name )
SELECT
  *
FROM
  customer_type
