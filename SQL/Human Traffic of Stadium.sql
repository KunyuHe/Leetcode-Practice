SELECT DISTINCT s1.*
FROM stadium AS s1, stadium AS s2, stadium AS s3
WHERE s1.people >= 100 AND s2.people >= 100 AND s3.people >= 100
AND ((s1.id - s2.id = 1 AND s1.id - s3.id = 2 AND s2.id - s3.id = 1) OR
     (s2.id - s1.id = 1 AND s2.id - s3.id = 2 AND s1.id - s3.id = 1) OR
     (s3.id - s2.id = 1 AND s2.id - s1.id = 1 AND s3.id - s1.id = 2))
ORDER BY s1.id
