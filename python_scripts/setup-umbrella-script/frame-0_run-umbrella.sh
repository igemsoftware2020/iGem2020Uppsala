#!/bin/bash

# Short equilibration
grompp -f npt_umbrella.mdp -c conf0.gro -p topol.top -n index.ndx -o npt0.tpr
mdrun -deffnm npt0

# Umbrella run
grompp -f md_umbrella.mdp -c npt0.gro -t npt0.cpt -p topol.top -n index.ndx -o umbrella0.tpr
mdrun -deffnm umbrella0 -pf pullf-umbrella0.xvg -px pullx-umbrella0.xvg


