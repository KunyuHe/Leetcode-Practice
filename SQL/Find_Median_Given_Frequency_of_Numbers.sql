SELECT AVG(Number) AS median
FROM Numbers AS n
WHERE (SELECT SUM(Frequency)
       FROM Numbers
       WHERE Number = n.Number) >=
      (SELECT ABS(SUM(SIGN(n.Number - Number)*Frequency))
       FROM Numbers)