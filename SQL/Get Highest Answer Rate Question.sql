SELECT
    question_id AS survey_log
FROM
    (SELECT question_id,
            IFNULL(SUM(IF(action = 'answer', 1, 0)) / SUM(IF(action='show', 1, 0)), 0) AS rate
     FROM survey_log
     GROUP BY question_id) AS temp
ORDER BY rate DESC
LIMIT 1; -- Will fail if tie


-- SOLUTION II (MS SQL Server)
WITH rates AS
(
    SELECT question_id,
           SUM(IIF(action = 'answer', 1, 0)) / SUM(IIF(action = 'show', 1, 0)) AS rate
     FROM survey_log
     GROUP BY question_id
)
SELECT question_id AS survey_log
FROM rates
WHERE rate >= (SELECT MAX(rate)
               FROM rates);
