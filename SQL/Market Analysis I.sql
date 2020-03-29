SELECT user_id AS buyer_id, join_date, IFNULL(COUNT(DISTINCT order_id), 0) AS orders_in_2019
FROM Users AS u
LEFT JOIN (SELECT buyer_id, order_id
           FROM Orders
           WHERE YEAR(order_date) = '2019') AS o
ON user_id = buyer_id
GROUP BY user_id, join_date;
