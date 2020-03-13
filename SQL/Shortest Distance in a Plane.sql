SELECT ROUND(MIN(SQRT(POWER(l.x - r.x, 2) + POWER(l.y - r.y, 2))), 2) AS shortest
FROM point_2d AS l
INNER JOIN point_2d AS r
ON l.x <> r.x OR l.y <> r.y