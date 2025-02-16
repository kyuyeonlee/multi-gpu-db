SELECT d_date AS "current_date", 
       LAG(d_date, 1) OVER (ORDER BY d_datekey) AS previous_day,
       LAG(d_date, 2) OVER (ORDER BY d_datekey) AS two_days_ago,
       LAG(d_date, 3) OVER (ORDER BY d_datekey) AS three_days_ago
FROM "date";