SELECT business_id
FROM Events AS e
JOIN (SELECT event_type, AVG(occurences) AS avg_freq
      FROM Events
      GROUP BY event_type) AS temp
ON e.event_type = temp.event_type AND occurences > avg_freq
GROUP BY business_id
HAVING COUNT(e.event_type) > 1;
