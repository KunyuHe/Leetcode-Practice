SELECT ROUND((SELECT COUNT(a1.player_id)
              FROM (SELECT player_id, event_date
                    FROM Activity) AS a1,
                   (SELECT player_id, MIN(event_date) AS first_login
                    FROM Activity
                    GROUP BY player_id) AS a2
              WHERE a1.player_id = a2.player_id AND
                    TO_DAYS(a1.event_date) - TO_DAYS(a2.first_login) = 1)
              /
              (SELECT COUNT(DISTINCT player_id)
               FROM Activity),
              2) AS fraction