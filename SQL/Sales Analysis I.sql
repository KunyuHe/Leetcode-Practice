SELECT seller_id
FROM Sales
GROUP BY seller_id
HAVING SUM(price) >= ALL(SELECT SUM(price)
                         FROM Sales
                         GROUP BY seller_id);

-- SOLUTION II (slow)
SELECT seller_id
FROM (SELECT seller_id,
      DENSE_RANK() OVER (ORDER BY SUM(price) DESC) AS rk
      FROM Sales
      GROUP BY seller_id) AS temp
WHERE rk = 1
