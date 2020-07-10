#!/bin/bash

# Short equilibration
grompp -f npt_umbrella.mdp -c conf149.gro -p topol.top -n index.ndx -o npt149.tpr
mdrun -deffnm npt149

# Umbrella run
grompp -f md_umbrella.mdp -c npt149.gro -t npt149.cpt -p topol.top -n index.ndx -o umbrella149.tpr
mdrun -deffnm umbrella149 -pf pullf-umbrella149.xvg -px pullx-umbrella149.xvg


