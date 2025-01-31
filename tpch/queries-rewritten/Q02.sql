with subquery as (
    select ps_partkey as subq_ps_partkey,
        min(ps_supplycost) as min_ps_supplicost
    from partsupp,
        supplier,
        nation,
        region
    where s_suppkey = ps_suppkey
        and s_nationkey = n_nationkey
        and n_regionkey = r_regionkey
        and r_name = 'EUROPE'
    group by subq_ps_partkey
)
select s_acctbal,
    s_name,
    n_name,
    p_partkey,
    p_mfgr,
    s_address,
    s_phone,
    s_comment
from part
    join partsupp on p_partkey = ps_partkey
    join supplier on s_suppkey = ps_suppkey
    join nation on s_nationkey = n_nationkey
    join region on n_regionkey = r_regionkey
    join subquery on subq_ps_partkey = ps_partkey
where ps_supplycost = min_ps_supplicost
    and p_size = 14
    and p_type like '% BRASS'
    and r_name = 'EUROPE'
order by s_acctbal desc,
    n_name,
    s_name,
    p_partkey
limit 100;