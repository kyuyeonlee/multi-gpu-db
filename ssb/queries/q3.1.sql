SELECT c_nation, s_nation, d_year, SUM(lo_revenue) AS revenue
FROM lineorder
JOIN customer ON lo_custkey = c_custkey
JOIN supplier ON lo_suppkey = s_suppkey
JOIN "date" ON lo_orderdate = d_datekey
WHERE c_region = 'ASIA'
  AND s_region = 'ASIA'
  AND d_year BETWEEN 1992 AND 1997
GROUP BY c_nation, s_nation, d_year
ORDER BY d_year, revenue DESC;