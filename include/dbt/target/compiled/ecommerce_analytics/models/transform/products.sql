WITH products_data AS(
SELECT 
    p.product_id,
    p.product_category_name,
    ct.string_field_1 AS product_category_name_english
FROM 
    `premium-weft-399214`.`ecommerce_analytics`.`products` p
INNER JOIN 
    `premium-weft-399214`.`ecommerce_analytics`.`category_translation` ct
ON 
    p.product_category_name = ct.string_field_0

    )
SELECT * FROM products_data
WHERE product_id IS NOT NULL