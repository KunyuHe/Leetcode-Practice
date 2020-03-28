SELECT install_dt, COUNT(player_id) AS installs, ROUND(COUNT(retention)/COUNT(player_id), 2) AS Day1_retention
FROM (SELECT a.player_id, a.install_dt, b.event_date AS retention
      FROM (SELECT player_id, MIN(event_date) AS install_dt
            FROM Activity
            GROUP BY player_id) AS a
      LEFT JOIN Activity AS b
      ON a.player_id = b.player_id AND TO_DAYS(a.install_dt) + 1 = TO_DAYS(b.event_date)) AS temp
GROUP BY install_dt
