SELECT c.c_city, COUNT(lo.lo_orderkey) AS order_count
FROM lineorder lo
JOIN customer c ON lo.lo_custkey = c.c_custkey
GROUP BY c.c_city;