import pandas as pd
from heavyai_utils import HeavyAITester


perfnums = {i: [] for i in range(1, 23)}

tester = HeavyAITester("tpchsf10sharded")

for i in range(10):
    perfrun = tester.run_tpch_all()

    for k in perfnums:
        perfnums[k].append(perfrun[k])

tester.close_connection()

df = pd.DataFrame.from_dict(perfnums)
df.to_csv('data/tpch-sf10-sharded.csv', index=False)

for k in perfnums:
    print(f'query{k}: {sum(perfnums[k]) / 10}')
