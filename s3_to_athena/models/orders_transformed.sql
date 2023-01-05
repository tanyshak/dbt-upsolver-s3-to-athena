AS INSERT INTO default_glue_catalog.database_16e61b.orders_transformed_data MAP_COLUMNS_BY_NAME

SELECT
  orderid AS order_id,
  MD5(customer.email) AS customer_id,
  customer_name,
  nettotal AS total,
  $event_time AS partition_date
FROM {{ ref(‘orders_row_data’) }}
LET customer_name = customer.firstname || ' ' || customer.lastname
WHERE ordertype = 'SHIPPING'
AND $event_time BETWEEN run_start_time() AND run_end_time();
