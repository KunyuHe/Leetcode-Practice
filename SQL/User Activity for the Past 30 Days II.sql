SELECT ROUND(IFNULL(COUNT(DISTINCT session_id) / COUNT(DISTINCT user_id), 0), 2) AS average_sessions_per_user
FROM Activity
WHERE activity_date BETWEEN SUBDATE('2019-07-27', INTERVAL 29 DAY) AND '2019-07-27';
