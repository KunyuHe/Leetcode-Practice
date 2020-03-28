SELECT p.project_id, p.employee_id
FROM Project AS p
JOIN Employee AS e
USING (employee_id)
WHERE e.experience_years >= (SELECT MAX(experience_years)
                             FROM Project JOIN Employee USING (employee_id)
                             WHERE project_id = p.project_id)

-- SOLUTION 2 (fast)
SELECT project_id, employee_id
FROM (SELECT p.project_id, p.employee_id,
      DENSE_RANK() OVER (PARTITION BY p.project_id ORDER BY e.experience_years DESC) AS rk
      FROM Project AS p
      JOIN Employee AS e
      ON p.employee_id = e.employee_id) AS temp
WHERE rk = 1
