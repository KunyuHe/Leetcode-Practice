SELECT name
FROM customer
WHERE ISNULL(referee_id) OR referee_id <> 2