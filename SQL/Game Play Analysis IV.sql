SELECT ROUND(IFNULL(
    (SELECT
         COUNT(DISTINCT a1.player_id)
     FROM
         (SELECT player_id, event_date
          FROM Activity) AS a1
         JOIN (SELECT player_id, MIN(event_date) AS first_login
               FROM Activity
               GROUP BY player_id) AS a2
             ON a1.player_id = a2.player_id AND DATEDIFF(a1.event_date, a2.first_login) = 1)
    /
    (SELECT COUNT(DISTINCT player_id)
     FROM Activity),
     0), 2) AS fraction
