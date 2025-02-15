SELECT SUM(lo_revenue) AS revenue, d_year, p_brand
FROM lineorder
JOIN "date" ON lo_orderdate = d_datekey
JOIN part ON lo_partkey = p_partkey
JOIN supplier ON lo_suppkey = s_suppkey
WHERE p_brand = 'MFGR#2221'
  AND s_region = 'EUROPE'
GROUP BY d_year, p_brand
ORDER BY d_year, p_brand;