import pandas as pd
from heavyai_utils import HeavyAITester


perfnums = {i: [] for i in [1, 2, 6, 11, 13, 14, 15, 16, 17, 19]}

tester = HeavyAITester("tpchsf100sharded", verbose=True)

for i in range(10):
    perfrun = tester.run_tpch_batch([1, 2, 6, 11, 13, 14, 15, 16, 17, 19])

    for k in perfnums:
        perfnums[k].append(perfrun[k])

tester.close_connection()

df = pd.DataFrame.from_dict(perfnums)
df.to_csv('data/tpch-sf100-sharded.csv', index=False)

for k in perfnums:
    print(f'query{k}: {sum(perfnums[k]) / 10}')
