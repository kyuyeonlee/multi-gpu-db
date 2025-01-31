select sum(li.l_extendedprice) / 7.0 as avg_yearly
from lineitem li
   join part p on li.l_partkey = p.p_partkey
   join (
      select l_partkey,
         0.2 * avg(l_quantity) as quantity
      from lineitem
      group by l_partkey
   ) as quantities on li.l_partkey = quantities.l_partkey
   and li.l_quantity < quantities.quantity
where p.p_brand = 'Brand#23'
   and p.p_container = 'MED BOX';