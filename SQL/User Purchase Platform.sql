SELECT DISTINCT t1.spend_date,
                t2.platform,
                IFNULL(t3.total_amount, 0) AS total_amount,
                IFNULL(t3.total_users, 0) AS total_users
FROM spending AS t1
JOIN (SELECT 'desktop' AS platform, 1 AS rk
      UNION
      SELECT 'mobile', 2
      UNION
      SELECT 'both', 3) AS t2
LEFT JOIN (SELECT s1.spend_date, s2.platform_type,
                  sum(s1.amount) as total_amount,
                  count(distinct s1.user_id) as total_users
           FROM spending s1
           JOIN (SELECT user_id, spend_date,
                 IF(count(distinct platform) = 1, platform, 'both') AS platform_type
                 FROM spending
                 GROUP BY user_id, spend_date) AS s2
           USING (user_id, spend_date)
           GROUP BY s1.spend_date, s2.platform_type) AS t3
ON t2.platform = t3.platform_type and t3.spend_date = t1.spend_date
ORDER BY t2.rk, t1.spend_date;
