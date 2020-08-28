#!/usr/bin/env python
# coding: utf-8

# %%

import pandas as pd
from scipy.stats import spearmanr, pearsonr

# %%
# import data
selection_data = 'docking_sele.csv'
selection_df = pd.read_csv(selection_data, sep=',')

# %%

# loop through the datafile, comparing the groups of four to the
# experimental data which is stored in the last four rows of the dataframe

for pose, i in enumerate(range(0, 44, 4)):
    x = selection_df['Avg Affinity Kd'][i:i + 4]
    exp = selection_df['Avg Affinity Kd'][44:48]
    correlation, pval = spearmanr(x, exp)
    print('pose ', str(pose), 'compared to experimental - spearman')
    print(f'correlation={correlation:.6f}, p-value={pval:.6f}')
    correlationp, pvalp = pearsonr(x, exp)
    print('pose ', str(pose), 'compared to experimental - pearson')
    print(f'correlation={correlationp:.6f}, p-value={pvalp:.6f}')
