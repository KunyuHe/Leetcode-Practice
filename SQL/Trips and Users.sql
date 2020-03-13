SELECT Request_at AS Day, ROUND(COUNT(IF(Status LIKE 'cancelled%', TRUE, NULL)) / COUNT(*), 2) AS 'Cancellation Rate'
FROM Trips
WHERE (Request_at BETWEEN '2013-10-01' AND '2013-10-03') AND Client_Id NOT IN (SELECT Users_Id
                                                                               FROM Users
                                                                               WHERE Banned = 'Yes') 
GROUP BY Request_at