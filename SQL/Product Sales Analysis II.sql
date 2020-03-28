SELECT p.product_id, SUM(s.quantity) AS total_quantity
FROM Product AS p
INNER JOIN Sales AS s
USING (product_id)
GROUP BY p.product_id;
