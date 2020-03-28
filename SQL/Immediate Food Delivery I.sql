SELECT ROUND(100 * SUM(IF(order_date=customer_pref_delivery_date, 1, 0)) / COUNT(delivery_id), 2) AS immediate_percentage
FROM Delivery;
