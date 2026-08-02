#------------------------------------------------------------------    
#RFM raw query table creation
#------------------------------------------------------------------

SELECT
    dc.customer_unique_id,
    o.order_id,
    o.order_purchase_timestamp,
    oi.order_item_id,
    oi.product_id,
    oi.price,
    oi.freight_value,
    (oi.price + oi.freight_value) AS item_total
FROM order_items oi
JOIN orders o
    ON oi.order_id = o.order_id
JOIN dim_customers dc
    ON o.customer_id = dc.customer_id
WHERE o.order_status = 'delivered'
    AND o.order_purchase_timestamp IS NOT NULL;