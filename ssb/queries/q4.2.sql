SELECT d_year, s_nation, p_category, SUM(lo_revenue - lo_supplycost) AS profit
FROM lineorder
JOIN "date" ON lo_orderdate = d_datekey
JOIN supplier ON lo_suppkey = s_suppkey
JOIN part ON lo_partkey = p_partkey
WHERE s_region = 'AMERICA'
  AND p_mfgr = 'MFGR#12'
  AND d_year BETWEEN 1992 AND 1997
GROUP BY d_year, s_nation, p_category
ORDER BY d_year, profit DESC;