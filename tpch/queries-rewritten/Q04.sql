select o_orderpriority,
    count(*) as order_count
from orders
where o_orderdate >= date '1993-07-01'
    and o_orderdate < date '1993-07-01' + interval '3' month
    and o_orderkey in (
        select distinct l_orderkey as subq_l_orderkey
        from lineitem
        where l_commitdate < l_receiptdate
    )
group by o_orderpriority
order by o_orderpriority;