
  
    

    create or replace table `premium-weft-399214`.`ecommerce_analytics`.`orders`
    
    

    OPTIONS()
    as (
      -- WITH orders_data AS (
--   SELECT DISTINCT
--     o.order_id,
--     o.customer_id,
--     o.order_status,
--     FORMAT_TIMESTAMP('%Y/%m/%d', CAST(o.order_purchase_timestamp AS TIMESTAMP)) AS order_purchase_timestamp,
--     -- DATE(o.order_purchase_timestamp) AS order_purchase_date,
--     FORMAT_TIMESTAMP('%Y/%m/%d', CAST(o.order_approved_at AS TIMESTAMP)) AS order_approved_at,
--     FORMAT_TIMESTAMP('%Y/%m/%d', CAST(o.order_delivered_carrier_date AS TIMESTAMP)) AS order_delivered_carrier_date,
--     FORMAT_TIMESTAMP('%Y/%m/%d', CAST(o.order_delivered_customer_date AS TIMESTAMP)) AS order_delivered_customer_date,
--     FORMAT_TIMESTAMP('%Y/%m/%d', CAST(o.order_estimated_delivery_date AS TIMESTAMP)) AS order_estimated_delivery_date,
--     op.payment_type,
--     op.payment_value
--   FROM 
--     `premium-weft-399214`.`ecommerce_analytics`.`orders` o
--   JOIN 
--     `premium-weft-399214`.`ecommerce_analytics`.`order_payments` op
--   ON 
--     o.order_id = op.order_id
-- )

-- SELECT * FROM orders_data
-- WHERE order_id IS NOT NULL
    );
  