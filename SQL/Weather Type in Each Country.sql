SELECT c.country_name,
       CASE
         WHEN Avg(w.weather_state) <= 15 THEN 'Cold'
         WHEN Avg(w.weather_state) >= 25 THEN 'Hot'
         ELSE 'Warm'
       END AS weather_type
FROM countries AS c
JOIN weather AS w
USING (country_id)
WHERE Month(w.day) = 11 AND Year(w.day) = 2019
GROUP BY c.country_name;
