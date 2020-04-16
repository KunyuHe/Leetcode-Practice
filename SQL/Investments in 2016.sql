SELECT
    ROUND(SUM(TIV_2016), 2) AS TIV_2016
FROM insurance AS i
WHERE
    TIV_2015 IN (SELECT TIV_2015
                 FROM insurance
                 WHERE PID <> i.PID)
    AND (LAT, LON) NOT IN (SELECT LAT, LON
                           FROM insurance
                           WHERE PID <> i.PID);
