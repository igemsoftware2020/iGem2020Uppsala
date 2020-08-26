#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Aug  4 11:44:29 2020

@author: http://stochpy.sourceforge.net/examples.html#advanced_protein_synthesis
"""

"""
Interactive modeling session (iPython) with StochPy
for performing sequential simulations
"""
import stochpy, numpy as np,copy,os,matplotlib.gridspec as gridspec




import matplotlib.gridspec as gridspec
import os
import copy
import numpy as np
import stochpy
def doSequentialSim(smod, n_generations, cell_division_times):
    for i in range(1, n_generations):
        ### divide each species between two daughter cells ###
        for j in range(0, len(smod.data_stochsim.species_labels)):
            species_amount = smod.SSA.sim_output[-2][1:][j]
            if species_amount:
                smod.settings.X_matrix[j] = np.random.binomial(
                    n=species_amount, p=0.5, size=1)
        ### replace last time point with species amounts after division ###
        species_after_division = copy.deepcopy(list(smod.settings.X_matrix))
        species_after_division.insert(0, cell_division_times[0:i].sum())
        # no reaction occurred at cell division
        species_after_division.append(np.NAN)
        smod.SSA.sim_output[-1] = copy.deepcopy(species_after_division)
        ### Set settings for new simulation and simulate the next generation ###
        smod.settings.starttime = copy.deepcopy(smod.SSA.sim_output[-1][0])
        smod.settings.endtime = smod.settings.starttime + \
            cell_division_times[i]
        smod.SSA.Execute(smod.settings, False)  # do stochastic simulation
    smod.FillDataStochsim()  # add all data to data_stochsim object


smod = stochpy.SSA('celldivision_explicit.psc', dir=os.getcwd())
T_GENERATION = 60

### 1: Do short simulations for a time series plot ###
N_GENERATIONS = 10
CELL_DIVISION_TIMES = abs(np.random.gamma(T_GENERATION, 1, size=N_GENERATIONS))
smod.DoStochSim(end=CELL_DIVISION_TIMES[0], mode='time', trajectories=1)
doSequentialSim(smod, N_GENERATIONS, CELL_DIVISION_TIMES)
smod.PlotSpeciesTimeSeries(species2plot=['Protein'])

### 2: Do long simulation for probability density function of protein copy numbers ###
N_GENERATIONS = 2500
CELL_DIVISION_TIMES = abs(np.random.gamma(T_GENERATION, 1, size=N_GENERATIONS))
smod.DoStochSim(end=CELL_DIVISION_TIMES[0], mode='time', trajectories=1)
doSequentialSim(smod, N_GENERATIONS, CELL_DIVISION_TIMES)
smod.PlotSpeciesDistributions(species2plot='Protein', colors=['red'])
