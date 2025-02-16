SELECT lo_orderdate, 
       lo_orderkey, 
       SUM(lo_revenue) OVER (PARTITION BY lo_orderdate ORDER BY lo_orderkey) AS running_total
FROM lineorder
WHERE lo_orderdate = 19940629; 