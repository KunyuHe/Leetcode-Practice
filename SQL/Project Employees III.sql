-- MS SQL Server
WITH t AS
    (
     SELECT p.project_id, e.*
     FROM Project AS p
          JOIN Employee AS e ON p.employee_id = e.employee_id
    )
SELECT
    project_id,
    employee_id
FROM
    t AS temp
WHERE
    experience_years >= (SELECT MAX(experience_years)
                         FROM t
                         WHERE project_id = temp.project_id);

-- SOLUTION 2
SELECT project_id, employee_id
FROM (SELECT p.project_id, p.employee_id,
      DENSE_RANK() OVER (PARTITION BY p.project_id ORDER BY e.experience_years DESC) AS rk
      FROM Project AS p
      JOIN Employee AS e
      ON p.employee_id = e.employee_id) AS temp
WHERE rk = 1
