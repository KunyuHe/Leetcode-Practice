SELECT project_id
FROM Project
GROUP BY project_id
HAVING COUNT(employee_id) >= ALL(SELECT COUNT(employee_id)
                                 FROM Project
                                 GROUP BY project_id);

-- SOLUTION II (slow)
SELECT project_id
FROM (SELECT project_id, RANK() OVER(ORDER BY COUNT(DISTINCT employee_id) DESC) AS rk
      FROM Project
      GROUP BY project_id) AS tenp
WHERE rk = 1;
