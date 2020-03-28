SELECT ad_id,
       ROUND(IFNULL(100 * SUM(IF(action='Clicked', 1, 0)) / SUM(IF(action <> 'Ignored', 1, 0)), 0), 2) AS ctr
FROM Ads
GROUP BY ad_id
ORDER BY ctr DESC, ad_id;
