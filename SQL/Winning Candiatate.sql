SELECT Name
FROM Candidate
WHERE id = (SELECT CandidateId
            FROM Vote
            GROUP BY CandidateId
            ORDER BY COUNT(id) DESC
            LIMIT 1)

-- SOLUTION II (allow tie)
SELECT
    Name
FROM
    Candidate AS c
    JOIN Vote AS v ON c.id = v.CandidateId
GROUP BY c.id
HAVING COUNT(v.id) >= ALL(SELECT COUNT(id)
                          FROM Vote
                          GROUP BY CandidateId);
