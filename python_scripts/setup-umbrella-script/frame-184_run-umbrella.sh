#!/bin/bash

# Short equilibration
grompp -f npt_umbrella.mdp -c conf184.gro -p topol.top -n index.ndx -o npt184.tpr
mdrun -deffnm npt184

# Umbrella run
grompp -f md_umbrella.mdp -c npt184.gro -t npt184.cpt -p topol.top -n index.ndx -o umbrella184.tpr
mdrun -deffnm umbrella184 -pf pullf-umbrella184.xvg -px pullx-umbrella184.xvg


