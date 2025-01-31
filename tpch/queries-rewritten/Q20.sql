with corrsq as (
    select l_partkey,
        l_suppkey,
        0.5 * sum(l_quantity) sum_subq
    from lineitem
    where l_shipdate >= date '1994-01-01'
        and l_shipdate < date '1994-01-01' + interval '1' year
    group by 1,
        2
)
select s_name,
    s_address
from supplier,
    nation
where s_suppkey in (
        select distinct ps_suppkey
        from partsupp
            join corrsq on corrsq.l_partkey = ps_partkey
            and corrsq.l_suppkey = ps_suppkey
        where ps_partkey in (
                select distinct p_partkey
                from part
                where p_name like 'forest%'
            )
            and ps_availqty > corrsq.sum_subq
    )
    and s_nationkey = n_nationkey
    and n_name = 'CANADA'
order by s_name;