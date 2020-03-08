# Write your MySQL query statement below

# SOLUTION 1
SELECT l.Score AS Score, COUNT(DISTINCT r.Score) AS Rank
FROM Scores AS l
INNER JOIN Scores AS r
ON l.Score <= r.Score
GROUP BY l.Id
ORDER BY l.Score DESC;

# SOLUTION 2
SELECT Score, (SELECT COUNT(*)
               FROM (SELECT DISTINCT Score AS s
                     FROM Score)
               WHERE s >= Score) AS Rank
FROM Scores
ORDER BY Scores DESC;