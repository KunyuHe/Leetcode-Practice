# SOLUTION I
SELECT a.player_id, a.device_id
FROM Activity AS a
INNER JOIN (SELECT player_id, MIN(event_date) AS first_login
            FROM Activity
            GROUP BY player_id) AS f
ON a.player_id = f.player_id AND a.event_date = f.first_login

# SOLUTION II
SELECT player_id, device_id
FROM Activity
WHERE (player_id, event_date) IN (SELECT player_id, MIN(event_date) AS event_date
                                  FROM Activity
                                  GROUP BY player_id)