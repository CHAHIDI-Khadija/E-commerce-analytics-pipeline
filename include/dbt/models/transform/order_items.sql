-- WITH order_items_data AS(
-- SELECT DISTINCT
--     order_id, 
--     order_item_id, 
--     product_id, 
--     seller_id, 
--     FORMAT_TIMESTAMP('%Y/%m/%d',shipping_limit_data) AS shipping_limit_data, 
--     price

-- FROM 
--     {{ source('ecommerce_analytics', 'order_items') }}
-- )
-- SELECT * FROM order_items_data
-- WHERE order_item_id IS NOT NULL
