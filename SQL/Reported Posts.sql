SELECT extra AS report_reason, COUNT(DISTINCT post_id) AS report_count
FROM Actions
WHERE ADDDATE(action_date, INTERVAL 1 DAY) = '2019-07-05' AND action = 'report'
GROUP BY extra
