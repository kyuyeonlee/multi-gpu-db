select
    /*+ cpu_mode */
    100.00 * sum(
        case
            when p_type like 'PROMO%' then l_extendedprice *(1 - l_discount)
            else 0
        end
    ),
    sum(l_extendedprice * (1 - l_discount)) as promo_revenue
from lineitem,
    part
where l_partkey = p_partkey
    and l_shipdate >= date '1995-09-01'
    and l_shipdate < date '1995-09-01' + interval '1' month;

-- LogicalProject(EXPR$0=[*(100.00:DECIMAL(5, 2), $0)], promo_revenue=[$1])
--   LogicalAggregate(group=[{}], agg#0=[SUM($0)], promo_revenue=[SUM($1)])
--     LogicalProject($f0=[CASE(LIKE($21, 'PROMO%'), *($5, -(1, $6)), 0:FLOAT)], $f1=[*($5, -(1, $6))])
--       LogicalFilter(condition=[AND(=($1, $17), >=($10, 1995-09-01), <($10, +(1995-09-01, 1:INTERVAL MONTH)))])
--         LogicalJoin(condition=[true], joinType=[inner])
--           LogicalTableScan(table=[[tpchsf100sharded, lineitem]])
--           LogicalTableScan(table=[[tpchsf100sharded, part]])
