SELECT c.c_name, d.d_year, SUM(lo.lo_revenue) AS total_revenue
FROM lineorder lo
JOIN customer c ON lo.lo_custkey = c.c_custkey
JOIN "date" d ON lo.lo_orderdate = d.d_datekey
WHERE d.d_year = 1994
GROUP BY c.c_name, d.d_year
ORDER BY total_revenue DESC
LIMIT 1000;