SELECT question_id AS survey_log
FROM (SELECT question_id, (SUM(IF(action='answer', 1, 0)) / SUM(IF(action='show', 1, 0))) AS ans_rate
      FROM survey_log
      GROUP BY question_id) AS ans_rates
ORDER BY ans_rate DESC
LIMIT 1 # May fail tie cases