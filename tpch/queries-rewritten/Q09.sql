select nation,
    o_year,
    cast(sum(amount) as double) as sum_profit
from (
        select n_name as nation,
            extract(
                year
                from o_orderdate
            ) as o_year,
            cast(l_extendedprice as double) * (1 - l_discount) - ps_supplycost * l_quantity as amount
        from part,
            supplier,
            lineitem,
            partsupp,
            orders,
            nation
        where s_suppkey = l_suppkey
            and ps_suppkey = l_suppkey
            and ps_partkey = l_partkey
            and p_partkey = l_partkey
            and o_orderkey = l_orderkey
            and s_nationkey = n_nationkey
            and p_name like '%green%'
    ) as profit
group by nation,
    o_year
order by nation,
    o_year desc;