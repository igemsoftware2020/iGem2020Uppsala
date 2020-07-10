#!/bin/bash

# Short equilibration
grompp -f npt_umbrella.mdp -c conf241.gro -p topol.top -n index.ndx -o npt241.tpr
mdrun -deffnm npt241

# Umbrella run
grompp -f md_umbrella.mdp -c npt241.gro -t npt241.cpt -p topol.top -n index.ndx -o umbrella241.tpr
mdrun -deffnm umbrella241 -pf pullf-umbrella241.xvg -px pullx-umbrella241.xvg


