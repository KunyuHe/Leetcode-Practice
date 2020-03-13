SELECT s.name
FROM salesperson AS s
LEFT JOIN orders AS o USING (sales_id)
LEFT JOIN company AS c USING (com_id)
GROUP BY s.sales_id
HAVING SUM(IF(c.name = 'RED', 1, 0)) = 0