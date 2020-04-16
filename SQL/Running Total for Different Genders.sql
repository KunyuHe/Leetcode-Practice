SELECT a.gender, a.day, SUM(b.score_points) AS total
FROM Scores AS a
CROSS JOIN Scores AS b
ON a.gender = b.gender AND a.day >= b.day
GROUP BY a.gender, a.day
ORDER BY a.gender, a.day;

-- SOLUTION II (slow)
SELECT gender, day,
       SUM(score_points) OVER (PARTITION BY gender ORDER BY day RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROWS) AS total
FROM Scores
