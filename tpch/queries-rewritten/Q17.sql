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

-- LogicalProject(avg_yearly=[/($0, 7.0:DECIMAL(2, 1))])
--   LogicalAggregate(group=[{}], agg#0=[SUM($0)])
--     LogicalProject(l_extendedprice=[$5])
--       LogicalFilter(condition=[AND(=($20, 'Brand#23'), =($23, 'MED BOX'))])
--         LogicalJoin(condition=[AND(=($1, $27), <($4, $28))], joinType=[inner])
--           LogicalJoin(condition=[=($1, $17)], joinType=[inner])
--             LogicalTableScan(table=[[tpchsf100sharded, lineitem]])
--             LogicalTableScan(table=[[tpchsf100sharded, part]])
--           LogicalProject(l_partkey=[$0], quantity=[*(0.2:DECIMAL(2, 1), $1)])
--             LogicalAggregate(group=[{0}], agg#0=[AVG($1)])
--               LogicalProject(l_partkey=[$1], l_quantity=[$4])
--                 LogicalTableScan(table=[[tpchsf100sharded, lineitem]])