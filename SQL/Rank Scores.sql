-- Write your MySQL query statement below

-- SOLUTION 1
SELECT
    l.Score, COUNT(DISTINCT r.Score) AS Rank
FROM
    Scores AS l
    JOIN Scores AS r
        ON l.Score <= r.Score
GROUP BY
    l.Id
ORDER BY
    Score DESC;

-- SOLUTION 2
SELECT
    Score,
    (SELECT COUNT( DISTINCT Score)
     FROM Scores
     WHERE s.Score >= Score) AS Rank
FROM
    Scores
ORDER BY
    Scores DESC;
