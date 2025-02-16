import pandas as pd
from heavyai_utils import (
    HeavyAITester,
    SSB_QUERIES,
    SSB_CUSTOM_QUERIES
)


perfnums = {i: [] for i in SSB_CUSTOM_QUERIES}

tester = HeavyAITester("ssbsf100")

for i in range(10):
    perfrun = tester.run_ssb_custom_all()
    for k in SSB_CUSTOM_QUERIES:
        perfnums[k].append(perfrun[k])

tester.close_connection()

df = pd.DataFrame.from_dict(perfnums)
df.to_csv('data/ssb-custom-sf100.csv', index=False)

for k in perfnums:
    print(f'query{k}: {sum(perfnums[k]) / 10}')
