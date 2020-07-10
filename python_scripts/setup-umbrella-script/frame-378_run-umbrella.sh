#!/bin/bash

# Short equilibration
grompp -f npt_umbrella.mdp -c conf378.gro -p topol.top -n index.ndx -o npt378.tpr
mdrun -deffnm npt378

# Umbrella run
grompp -f md_umbrella.mdp -c npt378.gro -t npt378.cpt -p topol.top -n index.ndx -o umbrella378.tpr
mdrun -deffnm umbrella378 -pf pullf-umbrella378.xvg -px pullx-umbrella378.xvg


