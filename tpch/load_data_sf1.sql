COPY region FROM '/var/lib/heavyai/storage/import/tpch/sf1/region.csv' WITH (delimiter='|', header='false');
COPY nation FROM '/var/lib/heavyai/storage/import/tpch/sf1/nation.csv' WITH (delimiter='|', header='false');
COPY part FROM '/var/lib/heavyai/storage/import/tpch/sf1/part.csv' WITH (delimiter='|', header='false');
COPY supplier FROM '/var/lib/heavyai/storage/import/tpch/sf1/supplier.csv' WITH (delimiter='|', header='false');
COPY partsupp FROM '/var/lib/heavyai/storage/import/tpch/sf1/partsupp.csv' WITH (delimiter='|', header='false');
COPY customer FROM '/var/lib/heavyai/storage/import/tpch/sf1/customer.csv' WITH (delimiter='|', header='false');
COPY orders FROM '/var/lib/heavyai/storage/import/tpch/sf1/orders.csv' WITH (delimiter='|', header='false');
COPY lineitem FROM '/var/lib/heavyai/storage/import/tpch/sf1/lineitem.csv' WITH (delimiter='|', header='false');