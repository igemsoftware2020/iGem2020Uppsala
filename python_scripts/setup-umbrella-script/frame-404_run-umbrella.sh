#!/bin/bash

# Short equilibration
grompp -f npt_umbrella.mdp -c conf404.gro -p topol.top -n index.ndx -o npt404.tpr
mdrun -deffnm npt404

# Umbrella run
grompp -f md_umbrella.mdp -c npt404.gro -t npt404.cpt -p topol.top -n index.ndx -o umbrella404.tpr
mdrun -deffnm umbrella404 -pf pullf-umbrella404.xvg -px pullx-umbrella404.xvg


