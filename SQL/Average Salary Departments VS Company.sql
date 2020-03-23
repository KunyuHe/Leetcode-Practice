SELECT d.pay_month, d.department_id,
    CASE
        WHEN d.mean > c.mean THEN 'higher'
        WHEN d.mean = c.mean THEN 'same'
        ELSE 'lower'
    END AS comparison
FROM
    (SELECT department_id, DATE_FORMAT(pay_date, '%Y-%m') AS pay_month, AVG(s.amount) AS mean
     FROM salary AS s
     INNER JOIN employee AS e
     USING (employee_id)
     GROUP BY department_id, pay_month) AS d
INNER JOIN
    (SELECT DATE_FORMAT(pay_date, '%Y-%m') AS pay_month, AVG(amount) AS mean
     FROM salary
     GROUP BY pay_month) AS c
USING (pay_month)