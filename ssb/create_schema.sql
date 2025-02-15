CREATE TABLE "date" (
    d_datekey INT,
    d_date TEXT ENCODING DICT(32),
    d_dayofweek TEXT ENCODING DICT(32),
    d_month TEXT ENCODING DICT(32),
    d_year INT,
    d_yearmonthnum INT,
    d_yearmonth TEXT ENCODING DICT(32),
    d_daynuminweek INT,
    d_daynuminmonth INT,
    d_daynuminyear INT,
    d_monthnuminyear INT,
    d_weeknuminyear INT,
    d_sellingseason TEXT ENCODING DICT(32),
    d_lastdayinweekfl BOOLEAN,
    d_lastdayinmonthfl BOOLEAN,
    d_holidayfl BOOLEAN,
    d_weekdayfl BOOLEAN
);

CREATE TABLE customer (
    c_custkey INT,
    c_name TEXT ENCODING DICT(32),
    c_address TEXT,
    c_city TEXT ENCODING DICT(32),
    c_nation TEXT ENCODING DICT(32),
    c_region TEXT ENCODING DICT(32),
    c_phone TEXT,
    c_mktsegment TEXT ENCODING DICT(32)
);

CREATE TABLE supplier (
    s_suppkey INT,
    s_name TEXT ENCODING DICT(32),
    s_address TEXT,
    s_city TEXT ENCODING DICT(32),
    s_nation TEXT ENCODING DICT(32),
    s_region TEXT ENCODING DICT(32),
    s_phone TEXT
);

CREATE TABLE part (
    p_partkey INT,
    p_name TEXT ENCODING DICT(32),
    p_mfgr TEXT ENCODING DICT(32),
    p_category TEXT ENCODING DICT(32),
    p_brand TEXT ENCODING DICT(32),
    p_color TEXT ENCODING DICT(32),
    p_type TEXT ENCODING DICT(32),
    p_size INT,
    p_container TEXT ENCODING DICT(32)
);

CREATE TABLE lineorder (
    lo_orderkey INT,
    lo_linenumber INT,
    lo_custkey INT,
    lo_partkey INT,
    lo_suppkey INT,
    lo_orderdate INT,
    lo_priority TEXT ENCODING DICT(32),
    lo_shipproirity INT,
    lo_quantity INT,
    lo_extendedprice INT,
    lo_ordtotalprice INT,
    lo_discount INT,
    lo_revenue INT,
    lo_supplycost INT,
    lo_tax INT,
    lo_commitdate INT,
    lo_shipmode TEXT ENCODING DICT(32)
);
