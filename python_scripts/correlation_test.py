#!/usr/bin/env python
# coding: utf-8

# %%

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import spearmanr, pearsonr


# %%
#import data
sele_data = 'docking_sele.csv'
sele_df = pd.read_csv(sele_data, sep=',')


# %%


for pose, i in enumerate(range(0, 44, 4)):
    x = sele_df['Avg Affinity Kd'][i:i+4]
    exp = sele_df['Avg Affinity Kd'][40:44]
    correlation, pval = spearmanr(x, exp)
    print('pose ', str(pose), 'compared to experimental - spearman')
    print(f'correlation={correlation:.6f}, p-value={pval:.6f}')
    correlationp, pvalp = pearsonr(x, exp)
    print('pose ', str(pose), 'compared to experimental - pearson')
    print(f'correlation={correlationp:.6f}, p-value={pvalp:.6f}')
