WITH seller_data AS (
    SELECT DISTINCT
        s.seller_id,
        s.seller_zip_code_prefix,
        s.seller_city,
        s.seller_state,
        g.geolocation_lat,
        g.geolocation_lng
    FROM 
        {{ source('ecommerce_analytics', 'sellers') }} s
    LEFT JOIN 
        {{ source('ecommerce_analytics', 'geolocation') }} g
      ON 
        s.seller_zip_code_prefix = g.geolocation_zip_code_prefix
      )

select * from seller_data
where seller_id IS NOT NULL