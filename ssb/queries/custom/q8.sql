SELECT lo_orderdate, 
       lo_orderkey, 
       lo_revenue, 
       LAG(lo_revenue) OVER (PARTITION BY lo_orderdate ORDER BY lo_orderkey) AS previous_revenue,
       lo_revenue - LAG(lo_revenue) OVER (PARTITION BY lo_orderdate ORDER BY lo_orderkey) AS revenue_change
FROM lineorder
WHERE lo_orderdate = 19940629;