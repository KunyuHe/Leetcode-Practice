SELECT MIN(ABS(l.x - r.x)) AS shortest
FROM point AS l
INNER JOIN point AS r
ON l.x <> r.x