SELECT
    id,
    COUNT(DISTINCT friend_id) AS num
FROM
    (SELECT accepter_id AS id, requester_id AS friend_id
     FROM request_accepted
     UNION
     SELECT requester_id, accepter_id
     FROM request_accepted) AS friends
GROUP BY id
ORDER BY num DESC
LIMIT 1; -- Will fail tie

-- SOLUTION II (more general)
WITH temp AS
    (SELECT
         id,
         COUNT(DISTINCT friend_id) AS num
     FROM
         (SELECT accepter_id AS id, requester_id AS friend_id
          FROM request_accepted
          UNION
          SELECT requester_id, accepter_id
          FROM request_accepted) AS friends
     GROUP BY id)
SELECT id, num
FROM temp
WHERE num >= (SELECT MAX(num)
              FROM temp);
