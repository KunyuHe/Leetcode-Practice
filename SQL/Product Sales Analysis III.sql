SELECT
    product_id,
    year AS first_year,
    quantity,
    price
FROM
    Sales
WHERE
    (product_id, year) IN (SELECT product_id, MIN(year)
                           FROM Sales
                           GROUP BY product_id);

-- SOLUTION II
SELECT s.product_id, temp.first_year, s.quantity, s.price
FROM Sales AS s
INNER JOIN (SELECT product_id, MIN(year) AS first_year
            FROM Sales
            GROUP BY product_id) AS temp
ON s.product_id = temp.product_id AND s.year = temp.first_year;
