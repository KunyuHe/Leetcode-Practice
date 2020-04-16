SELECT
    l.*
FROM
    (SELECT book_id, name
     FROM Books
     WHERE available_from <= SUBDATE("2019-06-23", INTERVAL 1 MONTH)) AS l
     LEFT JOIN (SELECT book_id, SUM(quantity) AS sold
                FROM Orders
                WHERE dispatch_date >= SUBDATE("2019-06-23", INTERVAL 1 YEAR)
                GROUP BY book_id) AS r
         USING (book_id)
WHERE
    IFNULL(r.sold, 0) < 10;

-- In the last year does not mean year 2018? Very strange
