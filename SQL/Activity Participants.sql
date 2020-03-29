SELECT activity
FROM Friends
GROUP BY activity
HAVING COUNT(name) < ANY(SELECT COUNT(name)
                         FROM Friends
                         GROUP BY activity) AND
       COUNT(name) > ANY(SELECT COUNT(name)
                         FROM Friends
                         GROUP BY activity);
