SELECT id1 AS id, COUNT(id1) AS num
FROM (# UNION would remove the reverse duplicates
      SELECT requester_id AS id1, accepter_id AS id2
      FROM request_accepted
      UNION
      SELECT accepter_id, requester_id
      FROM request_accepted) AS temp
GROUP BY id1
ORDER BY COUNT(id1) DESC
LIMIT 1