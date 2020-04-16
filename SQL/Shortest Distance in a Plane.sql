SELECT ROUND(MIN(dist), 2) AS shortest
FROM
    (SELECT SQRT(POWER((a.x - b.x), 2) + POWER((a.y - b.y), 2)) AS dist
     FROM
         point_2d AS a
         JOIN point_2d AS b
             ON a.x <> b.x OR a.y <> b.y
     ) AS temp;
