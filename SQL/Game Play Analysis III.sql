SELECT
    a1.player_id,
    a1.event_date,
    SUM(a2.games_played) AS games_played_so_far
FROM
    Activity AS a1
    JOIN Activity AS a2 ON a1.player_id = a2.player_id AND a1.event_date >= a2.event_date
GROUP BY
    a1.player_id,
    a1.event_date;

-- SOLUTION II (slow)
SELECT
    a.player_id,
    a.event_date,
    (SELECT SUM(games_played)
     FROM Activity
     WHERE player_id = a.player_id AND event_date <= a.event_date) AS games_played_so_far
FROM
    Activity AS a;
