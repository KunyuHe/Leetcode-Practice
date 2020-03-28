SELECT d.id,
MAX(CASE WHEN d.month='Jan' THEN d.revenue END) AS 'Jan_Revenue',
MAX(CASE WHEN d.month='Feb' THEN d.revenue END) AS 'Feb_Revenue',
MAX(CASE WHEN d.month='Mar' THEN d.revenue END) AS 'Mar_Revenue',
MAX(CASE WHEN d.month='Apr' THEN d.revenue END) AS 'Apr_Revenue',
MAX(CASE WHEN d.month='May' THEN d.revenue END) AS 'May_Revenue',
MAX(CASE WHEN d.month='Jun' THEN d.revenue END) AS 'Jun_Revenue',
MAX(CASE WHEN d.month='Jul' THEN d.revenue END) AS 'Jul_Revenue',
MAX(CASE WHEN d.month='Aug' THEN d.revenue END) AS 'Aug_Revenue',
MAX(CASE WHEN d.month='Sep' THEN d.revenue END) AS 'Sep_Revenue',
MAX(CASE WHEN d.month='Oct' THEN d.revenue END) AS 'Oct_Revenue',
MAX(CASE WHEN d.month='Nov' THEN d.revenue END) AS 'Nov_Revenue',
MAX(CASE WHEN d.month='Dec' THEN d.revenue END) AS 'Dec_Revenue'
FROM Department AS d
GROUP BY id;
