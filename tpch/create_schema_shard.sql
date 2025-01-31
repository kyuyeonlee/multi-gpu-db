CREATE TABLE region (
    r_regionkey INT,
    r_name TEXT ENCODING DICT(32),
    r_comment TEXT ENCODING DICT(32),
    SHARD KEY (r_regionkey)
) WITH (SHARD_COUNT = 2);

CREATE TABLE nation (
    n_nationkey INT,
    n_name TEXT ENCODING DICT(32),
    n_regionkey INT,
    n_comment TEXT ENCODING DICT(32),
    SHARD KEY (n_regionkey)
) WITH (SHARD_COUNT = 2);

CREATE TABLE part (
    p_partkey INT,
    p_name TEXT ENCODING DICT(32),
    p_mfgr TEXT ENCODING DICT(32),
    p_brand TEXT ENCODING DICT(32),
    p_type TEXT ENCODING DICT(32),
    p_size INT,
    p_container TEXT ENCODING DICT(32),
    p_retailprice FLOAT,
    p_comment TEXT ENCODING DICT(32)
);

CREATE TABLE supplier (
    s_suppkey INT,
    s_name TEXT ENCODING DICT(32),
    s_address TEXT ENCODING DICT(32),
    s_nationkey INT,
    s_phone TEXT ENCODING DICT(32),
    s_acctbal FLOAT,
    s_comment TEXT ENCODING DICT(32),
    SHARD KEY (s_nationkey)
) WITH (SHARD_COUNT = 2);

CREATE TABLE partsupp (
    ps_partkey INT,
    ps_suppkey INT,
    ps_availqty INT,
    ps_supplycost FLOAT,
    ps_comment TEXT ENCODING DICT(32)
);

CREATE TABLE customer (
    c_custkey INT,
    c_name TEXT ENCODING DICT(32),
    c_address TEXT ENCODING DICT(32),
    c_nationkey INT,
    c_phone TEXT ENCODING DICT(32),
    c_acctbal FLOAT,
    c_mktsegment TEXT ENCODING DICT(32),
    c_comment TEXT ENCODING DICT(32),
    SHARD KEY (c_nationkey)
) WITH (SHARD_COUNT = 2);

CREATE TABLE orders (
    o_orderkey INT,
    o_custkey INT,
    o_orderstatus TEXT ENCODING DICT(8),
    o_totalprice FLOAT,
    o_orderdate DATE,
    o_orderpriority TEXT ENCODING DICT(32),
    o_clerk TEXT ENCODING DICT(32),
    o_shippriority INT,
    o_comment TEXT ENCODING DICT(32),
    SHARD KEY (o_custkey)
) WITH (SHARD_COUNT = 2);

CREATE TABLE lineitem (
    l_orderkey INT,
    l_partkey INT,
    l_suppkey INT,
    l_linenumber INT,
    l_quantity FLOAT,
    l_extendedprice FLOAT,
    l_discount FLOAT,
    l_tax FLOAT,
    l_returnflag TEXT ENCODING DICT(8),
    l_linestatus TEXT ENCODING DICT(8),
    l_shipdate DATE,
    l_commitdate DATE,
    l_receiptdate DATE,
    l_shipinstruct TEXT ENCODING DICT(32),
    l_shipmode TEXT ENCODING DICT(32),
    l_comment TEXT ENCODING DICT(32)
);