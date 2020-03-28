SELECT book_id, name
FROM Books
WHERE available_from < ADDDATE("2019-06-23", INTERVAL -1 MONTH)
      AND book_id NOT IN (SELECT book_id
                          FROM Orders
                          WHERE dispatch_date > ADDDATE(DATE("2019-06-23"), INTERVAL -1 YEAR)
                          GROUP BY book_id
                          HAVING SUM(quantity) >= 10);
