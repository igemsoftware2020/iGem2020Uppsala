#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Mar  6 15:15:43 2020

@author: sebastianmoes

"""
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from collections import defaultdict

# csv files are available at https://igem.org/Team_List?year=[WRITE YEAR HERE]
# update the file variable to point to the csv you wish to examine
# as is this script looks for a 2019 team list downloaded on August 4 2020
# this script also assumes that file is in the current working directory
file = '2019__team_list__2020-08-04.csv'

#data import
team_data = pd.read_csv(file, sep = ",", header=0)
year = str(team_data.iloc[1][8])
title = ("iGem "+ str(team_data.iloc[1][8])+" Distribution of Projects by Track")

#data cleaning, removing spaces and removing high school and non-accepted projects
team_data.columns = team_data.columns.str.replace(' ', '')
team_data = team_data.drop(team_data[(team_data['Track'] == "High School") | (team_data['Status'] != "Accepted")].index)

# Establishing how to divide the data, in this case by region and country
# and then by Track, here called category
regions = team_data['Region'].unique()
countries = team_data['Country'].unique()
#categories = ["Environment", "Manufacturing" ,"Diagnostics" ,'Therapeutics',
# "New Application", "Foundational Advance", "Energy" ,"Food & Nutrition",
# "Open" ,"Software"]
categories = team_data['Track'].unique()
category_names = categories

# variables for graphing
numOfRows = team_data.shape[0]
results = defaultdict(list)

# Loop to go through the categories and create the graph
for i in regions:
    for q in categories:
        seriesObj = team_data.apply(lambda x: True if x['Region'] == i and x['Track'] == q else False , axis=1)
        numOfRows = len(seriesObj[seriesObj == True].index)
        results[i].append(numOfRows)


    for i in results:
        total = sum(results[i])
        if total == 0:
            total = 1
        percents = []
        for q in results[i]:
            percents.append(q/total)
        results[i] = percents

def survey(results, category_names):
    """
    Parameters
    ----------
    results : dict
        A mapping from question labels to a list of answers per category.
        It is assumed all lists contain the same number of entries and that
        it matches the length of *category_names*.
    category_names : list of str
        The category labels.
    """

    labels = list(results.keys())
    data = np.array(list(results.values()))
    data_cum = data.cumsum(axis=1)
    category_colors = plt.get_cmap('RdYlGn')(
        np.linspace(0.15, 0.85, data.shape[1]))

    fig, ax = plt.subplots(figsize=(26, 20))
    ax.invert_yaxis()
    ax.xaxis.set_visible(False)
    ax.set_xlim(0, np.sum(data, axis=1).max())
    ax.tick_params(axis='y', labelsize=40)
    for i, (colname, color) in enumerate(zip(category_names, category_colors)):
        widths = data[:, i]
        starts = data_cum[:, i] - widths
        ax.barh(labels, widths, left=starts, height=0.5,
                label=colname, color=color)
        xcenters = starts + widths / 2

        r, g, b, _ = color
        text_color = 'white' if r * g * b < 1 else 'darkgrey'
        for y, (x, c) in enumerate(zip(xcenters, widths)):
            ax.text(x, y, str(int(round((c*100))))+"%", ha='center', va='center',
                    color=text_color, fontsize=30)
    ax.legend(ncol=len(category_names), bbox_to_anchor=(-0.1, 0),
              loc='upper left', fontsize='x-large')
    plt.title(title, loc = 'center', fontsize=50)
    return fig, ax


survey(results, category_names)
filename = ("iGem"+str(year)+".png")
#plt.savefig(filename, dpi=400)
plt.show()
