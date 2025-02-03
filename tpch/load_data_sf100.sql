COPY region FROM '/var/lib/heavyai/storage/import/tpch/sf100/region.csv' WITH (delimiter='|', header='false');
COPY nation FROM '/var/lib/heavyai/storage/import/tpch/sf100/nation.csv' WITH (delimiter='|', header='false');
COPY part FROM '/var/lib/heavyai/storage/import/tpch/sf100/part.csv' WITH (delimiter='|', header='false');
COPY supplier FROM '/var/lib/heavyai/storage/import/tpch/sf100/supplier.csv' WITH (delimiter='|', header='false');
COPY partsupp FROM '/var/lib/heavyai/storage/import/tpch/sf100/partsupp.csv' WITH (delimiter='|', header='false');
COPY customer FROM '/var/lib/heavyai/storage/import/tpch/sf100/customer.csv' WITH (delimiter='|', header='false');
COPY orders FROM '/var/lib/heavyai/storage/import/tpch/sf100/orders.csv' WITH (delimiter='|', header='false');
COPY lineitem FROM '/var/lib/heavyai/storage/import/tpch/sf100/lineitem.csv' WITH (delimiter='|', header='false');