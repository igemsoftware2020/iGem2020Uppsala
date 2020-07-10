#!/bin/bash

# Short equilibration
grompp -f npt_umbrella.mdp -c conf416.gro -p topol.top -n index.ndx -o npt416.tpr
mdrun -deffnm npt416

# Umbrella run
grompp -f md_umbrella.mdp -c npt416.gro -t npt416.cpt -p topol.top -n index.ndx -o umbrella416.tpr
mdrun -deffnm umbrella416 -pf pullf-umbrella416.xvg -px pullx-umbrella416.xvg


