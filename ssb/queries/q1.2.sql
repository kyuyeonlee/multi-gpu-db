SELECT SUM(lo_extendedprice * (1 - lo_discount)) AS revenue
FROM lineorder
JOIN "date" ON lo_orderdate = d_datekey
WHERE d_yearmonth = 'Dec1993'
  AND lo_discount BETWEEN 4 AND 6
  AND lo_quantity BETWEEN 26 AND 35;