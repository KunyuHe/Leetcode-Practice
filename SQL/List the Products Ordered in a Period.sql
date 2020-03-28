SELECT product_name, SUM(unit) AS unit
FROM Orders AS o
JOIN Products AS p
USING (product_id)
WHERE YEAR(order_date) = '2020' AND MONTH(order_date) = '02'
GROUP BY o.product_id
HAVING unit >= 100;
