#!/bin/bash

# Short equilibration
grompp -f npt_umbrella.mdp -c conf351.gro -p topol.top -n index.ndx -o npt351.tpr
mdrun -deffnm npt351

# Umbrella run
grompp -f md_umbrella.mdp -c npt351.gro -t npt351.cpt -p topol.top -n index.ndx -o umbrella351.tpr
mdrun -deffnm umbrella351 -pf pullf-umbrella351.xvg -px pullx-umbrella351.xvg


