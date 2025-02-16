SELECT s.s_region, COUNT(lo.lo_orderkey) AS total_orders
FROM lineorder lo
JOIN supplier s ON lo.lo_suppkey = s.s_suppkey
GROUP BY s.s_region;