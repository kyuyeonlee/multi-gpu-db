COPY "date" FROM '/var/lib/heavyai/storage/import/ssb/sf100/date.csv' WITH (delimiter='|', header='false');
COPY customer FROM '/var/lib/heavyai/storage/import/ssb/sf100/customer.csv' WITH (delimiter='|', header='false');
COPY supplier FROM '/var/lib/heavyai/storage/import/ssb/sf100/supplier.csv' WITH (delimiter='|', header='false');
COPY part FROM '/var/lib/heavyai/storage/import/ssb/sf100/part.csv' WITH (delimiter='|', header='false');
COPY lineorder FROM '/var/lib/heavyai/storage/import/ssb/sf100/lineorder.csv' WITH (delimiter='|', header='false');