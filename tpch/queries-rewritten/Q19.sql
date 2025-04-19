select sum(l_extendedprice * (1 - l_discount)) as revenue
from lineitem,
    part
where (
        p_partkey = l_partkey
        and p_brand = 'Brand#12'
        and p_container in ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
        and l_quantity >= 1
        and l_quantity <= 1 + 10
        and p_size between 1 and 5
        and l_shipmode in ('AIR', 'AIR REG')
        and l_shipinstruct = 'DELIVER IN PERSON'
    )
    or (
        p_partkey = l_partkey
        and p_brand = 'Brand#23'
        and p_container in ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
        and l_quantity >= 10
        and l_quantity <= 10 + 10
        and p_size between 1 and 10
        and l_shipmode in ('AIR', 'AIR REG')
        and l_shipinstruct = 'DELIVER IN PERSON'
    )
    or (
        p_partkey = l_partkey
        and p_brand = 'Brand#34'
        and p_container in ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
        and l_quantity >= 20
        and l_quantity <= 20 + 10
        and p_size between 1 and 15
        and l_shipmode in ('AIR', 'AIR REG')
        and l_shipinstruct = 'DELIVER IN PERSON'
    );

--   LogicalAggregate(group=[{}], revenue=[SUM($0)])
--   LogicalProject($f0=[*($5, -(1, $6))])
--     LogicalFilter(condition=[OR(AND(=($17, $1), =($20, 'Brand#12'), OR(=($23, 'SM CASE'), =($23, 'SM BOX'), =($23, 'SM PACK'), =($23, 'SM PKG')), >=($4, 1), <=($4, +(1, 10)), >=($22, 1), <=($22, 5), OR(=($14, 'AIR'), =($14, 'AIR REG')), =($13, 'DELIVER IN PERSON')), AND(=($17, $1), =($20, 'Brand#23'), OR(=($23, 'MED BAG'), =($23, 'MED BOX'), =($23, 'MED PKG'), =($23, 'MED PACK')), >=($4, 10), <=($4, +(10, 10)), >=($22, 1), <=($22, 10), OR(=($14, 'AIR'), =($14, 'AIR REG')), =($13, 'DELIVER IN PERSON')), AND(=($17, $1), =($20, 'Brand#34'), OR(=($23, 'LG CASE'), =($23, 'LG BOX'), =($23, 'LG PACK'), =($23, 'LG PKG')), >=($4, 20), <=($4, +(20, 10)), >=($22, 1), <=($22, 15), OR(=($14, 'AIR'), =($14, 'AIR REG')), =($13, 'DELIVER IN PERSON')))])
--       LogicalJoin(condition=[true], joinType=[inner])
--         LogicalTableScan(table=[[tpchsf100sharded, lineitem]])
--         LogicalTableScan(table=[[tpchsf100sharded, part]])