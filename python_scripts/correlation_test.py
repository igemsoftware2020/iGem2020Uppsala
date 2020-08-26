#!/usr/bin/env python
# coding: utf-8

# In[52]:


import numpy as np
import pandas as pd
import scipy.stats


# In[53]:
#import data
sele_data = 'docking_sele.csv'
sele_df = pd.read_csv(sele_data, sep=',')


# In[54]:
#define functions

# Creating a function that takes in x and y values:
def spearmans_rank_correlation(xs, ys):
    
    # Calculate the rank of x's
    xranks = pd.Series(xs).rank()
    
    # Caclulate the ranking of the y's
    yranks = pd.Series(ys).rank()
    
    # Calculate Pearson's correlation coefficient on the ranked versions of the data
    return scipy.stats.pearsonr(xranks, yranks)


# In[55]:


# Run the function
spearmans_rank_correlation(x, y)[0]


# In[56]:


# Just to check our results, here it Spearman's using Scipy
scipy.stats.spearmanr(x, y)[0]


# In[57]:


import matplotlib.pyplot as plt
import seaborn as sns
sns.set()


# In[58]:


x=plt.xlabel("x")
y=plt.ylabel("y")
plt.show()


# In[ ]:


