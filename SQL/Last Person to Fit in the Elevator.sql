SELECT TOP 1 person_name
FROM (SELECT person_name, turn, SUM(weight) OVER (ORDER BY turn) AS cummulative_weight
      FROM Queue) AS temp
WHERE cummulative_weight <= 1000
ORDER BY turn DESC;

-- SOLUTION II (fast)
SELECT person_name
FROM (SELECT q.person_name,
             @cum_weight:= @cum_weight + q.weight cum_weight
      FROM Queue AS q
      JOIN (SELECT @cum_weight:= 0) AS t1
      ORDER BY q.turn) AS t2
WHERE cum_weight <= 1000
ORDER BY cum_weight DESC
LIMIT 1;
