select ps_partkey,
    sum(ps_supplycost * ps_availqty)
from partsupp,
    supplier,
    nation
where ps_suppkey = s_suppkey
    and s_nationkey = n_nationkey
    and n_name = 'GERMANY'
group by ps_partkey
having sum(ps_supplycost * ps_availqty) > (
        select sum(ps_supplycost * ps_availqty) * 0.000001
        from partsupp,
            supplier,
            nation
        where ps_suppkey = s_suppkey
            and s_nationkey = n_nationkey
            and n_name = 'GERMANY'
    )
order by 1 desc;