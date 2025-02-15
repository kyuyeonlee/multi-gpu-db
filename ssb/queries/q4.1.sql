SELECT d_year, c_nation, SUM(lo_revenue - lo_supplycost) AS profit
FROM lineorder
JOIN "date" ON lo_orderdate = d_datekey
JOIN customer ON lo_custkey = c_custkey
JOIN supplier ON lo_suppkey = s_suppkey
WHERE c_region = 'AMERICA'
  AND s_region = 'AMERICA'
  AND d_year BETWEEN 1992 AND 1997
GROUP BY d_year, c_nation
ORDER BY d_year, profit DESC;