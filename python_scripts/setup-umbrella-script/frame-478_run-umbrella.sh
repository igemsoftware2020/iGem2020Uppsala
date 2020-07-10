#!/bin/bash

# Short equilibration
grompp -f npt_umbrella.mdp -c conf478.gro -p topol.top -n index.ndx -o npt478.tpr
mdrun -deffnm npt478

# Umbrella run
grompp -f md_umbrella.mdp -c npt478.gro -t npt478.cpt -p topol.top -n index.ndx -o umbrella478.tpr
mdrun -deffnm umbrella478 -pf pullf-umbrella478.xvg -px pullx-umbrella478.xvg


