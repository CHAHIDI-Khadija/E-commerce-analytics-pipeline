WITH customer_data AS (
    SELECT DISTINCT
        c.customer_id,
        c.customer_unique_id,
        c.customer_zip_code_prefix,
        c.customer_city,
        c.customer_state,
        g.geolocation_lat,
        g.geolocation_lng
    FROM 
        {{ source('ecommerce_analytics', 'customers')}} c
    LEFT JOIN
        {{ source('ecommerce_analytics', 'geolocation')}} g
      ON 
        c.customer_zip_code_prefix = g.geolocation_zip_code_prefix
      )

SELECT * FROM customer_data
WHERE customer_id IS NOT NULL


