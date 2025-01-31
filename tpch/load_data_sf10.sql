COPY region FROM '/var/lib/heavyai/storage/import/tpch/sf10/region.csv' WITH (delimiter='|', header='false');
COPY nation FROM '/var/lib/heavyai/storage/import/tpch/sf10/nation.csv' WITH (delimiter='|', header='false');
COPY part FROM '/var/lib/heavyai/storage/import/tpch/sf10/part.csv' WITH (delimiter='|', header='false');
COPY supplier FROM '/var/lib/heavyai/storage/import/tpch/sf10/supplier.csv' WITH (delimiter='|', header='false');
COPY partsupp FROM '/var/lib/heavyai/storage/import/tpch/sf10/partsupp.csv' WITH (delimiter='|', header='false');
COPY customer FROM '/var/lib/heavyai/storage/import/tpch/sf10/customer.csv' WITH (delimiter='|', header='false');
COPY orders FROM '/var/lib/heavyai/storage/import/tpch/sf10/orders.csv' WITH (delimiter='|', header='false');
COPY lineitem FROM '/var/lib/heavyai/storage/import/tpch/sf10/lineitem.csv' WITH (delimiter='|', header='false');