SELECT c.c_name, 
       lo.lo_orderkey, 
       lo.lo_orderdate, 
       SUM(lo.lo_revenue) OVER (PARTITION BY c.c_custkey ORDER BY lo.lo_orderdate) AS total_spending
FROM customer c
JOIN lineorder lo ON c.c_custkey = lo.lo_custkey
WHERE lo.lo_orderdate = 19940629;