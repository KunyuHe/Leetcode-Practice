SELECT DATE_FORMAT(trans_date, '%Y-%m') AS month,
       country,
       SUM(IF(state = 'approved', 1, 0)) AS approved_count,
       SUM(IF(state = 'approved', amount, 0)) AS approved_amount,
       SUM(IF(state = 'chargeback', 1, 0)) AS chargeback_count,
       SUM(IF(state = 'chargeback', amount, 0)) AS chargeback_amount
FROM (SELECT id, country, 'chargeback' AS state, amount, c.trans_date
      FROM Transactions t
      RIGHT JOIN Chargebacks c
      ON t.id = c.trans_id
      UNION ALL
      SELECT id, country, state, amount, trans_date
      FROM Transactions) AS temp
GROUP BY month, country
HAVING approved_count + approved_amount + chargeback_count + chargeback_amount <> 0;
