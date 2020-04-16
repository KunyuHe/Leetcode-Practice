SELECT
    f.follower,
    COUNT(DISTINCT s.follower) AS num
FROM
    follow AS f
    JOIN follow AS s ON f.follower = s.followee
GROUP BY f.follower
ORDER BY f.follower;
