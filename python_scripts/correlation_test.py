#!/usr/bin/env python
# coding: utf-8
# to run from command line simply place this script in the same
# folder as docking_sele.csv containing the data formatted into groups of
# four

# %%
# environment setup
import pandas as pd
from scipy.stats import spearmanr, pearsonr

# %%
# import data
selection_data = 'docking_sele.csv'
selection_df = pd.read_csv(selection_data, sep=',')

# %%

# loop through the datafile, comparing the groups of four to the
# experimental data which is stored in the last four rows of the dataframe

for pose, i in enumerate(range(0,78, 4)):
    # create a list with just the generated data
    x = selection_df['Avg Affinity Kd'][i:i + 4]
    # select the last four elements of the list, which is the experimental data
    exp = selection_df['Avg Affinity Kd'][-4:]
    correlation, pval = spearmanr(x, exp)
    print(pose)
    print('pose ', str(pose), 'compared to experimental - spearman')
    print(f'correlation={correlation:.6f}, p-value={pval:.6f}')
    correlationp, pvalp = pearsonr(x, exp)
    print('pose ', str(pose), 'compared to experimental - pearson')
    print(f'correlation={correlationp:.6f}, p-value={pvalp:.6f}')
    if correlation >= 0.8:
        print('Winner winner chicken dinner')
    if correlationp >= 0.8:
        print('Winner winner chicken dinner')
