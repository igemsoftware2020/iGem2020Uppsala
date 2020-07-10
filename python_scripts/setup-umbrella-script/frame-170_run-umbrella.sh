#!/bin/bash

# Short equilibration
grompp -f npt_umbrella.mdp -c conf170.gro -p topol.top -n index.ndx -o npt170.tpr
mdrun -deffnm npt170

# Umbrella run
grompp -f md_umbrella.mdp -c npt170.gro -t npt170.cpt -p topol.top -n index.ndx -o umbrella170.tpr
mdrun -deffnm umbrella170 -pf pullf-umbrella170.xvg -px pullx-umbrella170.xvg


