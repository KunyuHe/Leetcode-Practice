SELECT a.visited_on, SUM(b.amount) AS amount, ROUND(SUM(b.amount) / 7, 2) AS average_amount
FROM (SELECT DISTINCT visited_on
      FROM Customer) AS a, Customer AS b
WHERE (TO_DAYS(a.visited_on) - TO_DAYS(b.visited_on)) BETWEEN 0 AND 6
GROUP BY a.visited_on
HAVING COUNT(DISTINCT b.visited_on) = 7
ORDER BY a.visited_on;
