SELECT ROUND(AVG(daily_percent), 2) AS average_daily_percent
FROM (SELECT 100 * COUNT(DISTINCT rem.post_id) / COUNT(DISTINCT rep.post_id) AS daily_percent
      FROM (SELECT post_id, action_date
            FROM Actions
            WHERE action = 'report' AND extra = 'spam') AS rep
      LEFT JOIN Removals AS rem
      USING (post_id)
      GROUP BY rep.action_date) AS daily;
