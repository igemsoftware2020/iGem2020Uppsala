#!/bin/bash

# Short equilibration
grompp -f npt_umbrella.mdp -c conf323.gro -p topol.top -n index.ndx -o npt323.tpr
mdrun -deffnm npt323

# Umbrella run
grompp -f md_umbrella.mdp -c npt323.gro -t npt323.cpt -p topol.top -n index.ndx -o umbrella323.tpr
mdrun -deffnm umbrella323 -pf pullf-umbrella323.xvg -px pullx-umbrella323.xvg


