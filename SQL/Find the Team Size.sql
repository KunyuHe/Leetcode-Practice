SELECT employee_id, team_size
FROM Employee
LEFT JOIN (SELECT team_id, COUNT(employee_id) AS team_size
           FROM employee
           GROUP BY team_id) AS temp
USING (team_id);
