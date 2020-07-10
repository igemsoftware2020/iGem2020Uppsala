#!/bin/bash

# Short equilibration
grompp -f npt_umbrella.mdp -c conf220.gro -p topol.top -n index.ndx -o npt220.tpr
mdrun -deffnm npt220

# Umbrella run
grompp -f md_umbrella.mdp -c npt220.gro -t npt220.cpt -p topol.top -n index.ndx -o umbrella220.tpr
mdrun -deffnm umbrella220 -pf pullf-umbrella220.xvg -px pullx-umbrella220.xvg


