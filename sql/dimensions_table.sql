#------------------------------------------------------------------
#dim_customers
#------------------------------------------------------------------

DROP TABLE IF EXISTS dim_customers;

CREATE TABLE dim_customers AS
SELECT
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
FROM customers;

ALTER TABLE dim_customers
    MODIFY customer_id VARCHAR(50) NOT NULL,
    ADD PRIMARY KEY (customer_id);

#------------------------------------------------------------------    
#dim_products
#------------------------------------------------------------------
DROP TABLE IF EXISTS dim_products;

CREATE TABLE dim_products AS
SELECT
    p.product_id,
    p.product_category_name,
    t.product_category_name_english,
    p.product_weight_g,
    p.product_length_cm,
    p.product_height_cm,
    p.product_width_cm
FROM products p
LEFT JOIN product_category_name_translation t
    ON p.product_category_name = t.product_category_name;

ALTER TABLE dim_products
    MODIFY product_id VARCHAR(50) NOT NULL,
    ADD PRIMARY KEY (product_id);

#------------------------------------------------------------------    
#dim_sellers
#------------------------------------------------------------------
DROP TABLE IF EXISTS dim_sellers;

CREATE TABLE dim_sellers AS
SELECT
    seller_id,
    seller_zip_code_prefix,
    seller_city,
    seller_state
FROM sellers;

ALTER TABLE dim_sellers
    MODIFY seller_id VARCHAR(50) NOT NULL,
    ADD PRIMARY KEY (seller_id);
    
#------------------------------------------------------------------   
#dim_date
#------------------------------------------------------------------
DROP TABLE IF EXISTS dim_date;

CREATE TABLE dim_date AS
SELECT DISTINCT
    DATE(order_purchase_timestamp) AS full_date,
    YEAR(order_purchase_timestamp) AS year,
    MONTH(order_purchase_timestamp) AS month,
    QUARTER(order_purchase_timestamp) AS quarter,
    DAYNAME(order_purchase_timestamp) AS day_of_week
FROM orders
WHERE order_purchase_timestamp IS NOT NULL;

ALTER TABLE dim_date
    ADD PRIMARY KEY (full_date);
    

#------------------------------------------------------------------   
#count to check for duplicate values if present
#------------------------------------------------------------------   
SELECT COUNT(*) FROM dim_customers;
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM dim_products;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM dim_sellers;
SELECT COUNT(*) FROM sellers;