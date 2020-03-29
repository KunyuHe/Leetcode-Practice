SELECT t.team_id, team_name, IFNULL(SUM(num_points), 0) AS num_points
FROM Teams AS t
LEFT JOIN (SELECT host_team as team_id,
                  SUM(CASE
                         WHEN host_goals > guest_goals then 3
                         WHEN host_goals = guest_goals then 1
                         ELSE 0
                      END) AS num_points
           FROM Matches
           GROUP BY host_team
           UNION ALL
           SELECT guest_team as team_id,
                  SUM(CASE
                         WHEN host_goals < guest_goals then 3
                         WHEN host_goals = guest_goals then 1
                         ELSE 0
                      END) AS num_points
           FROM Matches
           GROUP BY guest_team) AS p
USING (team_id)
GROUP BY t.team_id
ORDER BY num_points DESC, t.team_id;
