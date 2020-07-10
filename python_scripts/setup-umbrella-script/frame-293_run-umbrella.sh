#!/bin/bash

# Short equilibration
grompp -f npt_umbrella.mdp -c conf293.gro -p topol.top -n index.ndx -o npt293.tpr
mdrun -deffnm npt293

# Umbrella run
grompp -f md_umbrella.mdp -c npt293.gro -t npt293.cpt -p topol.top -n index.ndx -o umbrella293.tpr
mdrun -deffnm umbrella293 -pf pullf-umbrella293.xvg -px pullx-umbrella293.xvg


