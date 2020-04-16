SELECT
    (CASE
        WHEN MOD(id, 2) != 0 AND id != counts THEN id + 1
        WHEN MOD(id, 2) != 0 AND id = counts THEN id -- odd but last row
        ELSE id - 1
     END) AS id, student
FROM
    seat,
    (SELECT COUNT(*) AS counts
     FROM seat) AS temp
ORDER BY id;
