with x as (
    select l_partkey as x_partkey,
        0.2 * avg(l_quantity) the_quantity
    from lineitem
    group by x_partkey
)
select sum(l_extendedprice) / 7.0 as avg_yearly
from lineitem,
    part,
    x
where p_partkey = l_partkey
    and p_brand = 'Brand#21'
    and p_container = 'SM BOX'
    and x.x_partkey = l_partkey
    and l_quantity < x.the_quantity;