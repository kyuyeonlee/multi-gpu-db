SELECT SUM(lo_extendedprice * (100 - lo_discount) / 100) AS revenue
FROM lineorder
JOIN "date" ON lo_orderdate = d_datekey
WHERE d_year = 1993
  AND lo_discount BETWEEN 1 AND 3
  AND lo_quantity < 25;