(SELECT name AS results
 FROM Movie_Rating AS r1
 JOIN Users AS u
 USING (user_id)
 GROUP BY r1.user_id
 ORDER BY COUNT(*) DESC, name
 LIMIT 1)
UNION
(SELECT title
 FROM Movie_Rating AS r2
 JOIN Movies
 USING (movie_id)
 WHERE MONTH(created_at) = '02' AND YEAR(created_at) = '2020'
 GROUP BY r2.movie_id
 ORDER BY AVG(rating) DESC, title
 LIMIT 1);
