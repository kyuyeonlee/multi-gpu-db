select
    /*+ cpu_mode */
    p_brand,
    p_type,
    p_size,
    count(distinct ps_suppkey) as supplier_cnt
from partsupp,
    part
where p_partkey = ps_partkey
    and p_brand <> 'Brand#45'
    and p_type not like 'MEDIUM POLISHED%'
    and p_size in (49, 14, 23, 45.19, 3, 36, 9)
    and ps_suppkey not in (
        select s_suppkey
        from supplier
        where s_comment like '%Customer%Complaints%'
    )
group by p_brand,
    p_type,
    p_size
order by supplier_cnt desc,
    p_brand,
    p_type,
    p_size
limit 100;

-- LogicalSort(sort0=[$3], sort1=[$0], sort2=[$1], sort3=[$2], dir0=[DESC], dir1=[ASC], dir2=[ASC], dir3=[ASC], fetch=[100])
--   LogicalAggregate(group=[{0, 1, 2}], supplier_cnt=[COUNT(DISTINCT $3)])
--     LogicalProject(p_brand=[$9], p_type=[$10], p_size=[$11], ps_suppkey=[$1])
--       LogicalFilter(condition=[AND(=($6, $0), <>($9, 'Brand#45'), NOT(LIKE($10, 'MEDIUM POLISHED%')), OR(=($11, 49), =($11, 14), =($11, 23), =($11, 45.19), =($11, 3), =($11, 36), =($11, 9)), NOT(IN($1, {
-- LogicalProject(s_suppkey=[$0])
--   LogicalFilter(condition=[LIKE($6, '%Customer%Complaints%')])
--     LogicalTableScan(table=[[tpchsf100sharded, supplier]])
-- })))])
--         LogicalJoin(condition=[true], joinType=[inner])
--           LogicalTableScan(table=[[tpchsf100sharded, partsupp]])
--           LogicalTableScan(table=[[tpchsf100sharded, part]])