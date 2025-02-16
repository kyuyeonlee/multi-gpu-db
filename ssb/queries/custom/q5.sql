SELECT c.c_name, 
       RANK() OVER (PARTITION BY c.c_region ORDER BY SUM(lo.lo_revenue) DESC) AS "rank"
FROM lineorder lo
JOIN customer c ON lo.lo_custkey = c.c_custkey
GROUP BY c.c_name, c.c_region;