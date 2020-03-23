SELECT f.follower, COUNT(DISTINCT sdf.follower) AS num
FROM follow AS f
INNER JOIN follow AS sdf
ON f.follower = sdf.followee
GROUP BY f.follower
ORDER BY f.follower
