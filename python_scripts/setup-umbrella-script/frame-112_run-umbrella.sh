#!/bin/bash

# Short equilibration
grompp -f npt_umbrella.mdp -c conf112.gro -p topol.top -n index.ndx -o npt112.tpr
mdrun -deffnm npt112

# Umbrella run
grompp -f md_umbrella.mdp -c npt112.gro -t npt112.cpt -p topol.top -n index.ndx -o umbrella112.tpr
mdrun -deffnm umbrella112 -pf pullf-umbrella112.xvg -px pullx-umbrella112.xvg


