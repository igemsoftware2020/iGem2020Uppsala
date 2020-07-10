#!/bin/bash

# Short equilibration
grompp -f npt_umbrella.mdp -c conf285.gro -p topol.top -n index.ndx -o npt285.tpr
mdrun -deffnm npt285

# Umbrella run
grompp -f md_umbrella.mdp -c npt285.gro -t npt285.cpt -p topol.top -n index.ndx -o umbrella285.tpr
mdrun -deffnm umbrella285 -pf pullf-umbrella285.xvg -px pullx-umbrella285.xvg


