#!/bin/bash

# Short equilibration
grompp -f npt_umbrella.mdp -c conf443.gro -p topol.top -n index.ndx -o npt443.tpr
mdrun -deffnm npt443

# Umbrella run
grompp -f md_umbrella.mdp -c npt443.gro -t npt443.cpt -p topol.top -n index.ndx -o umbrella443.tpr
mdrun -deffnm umbrella443 -pf pullf-umbrella443.xvg -px pullx-umbrella443.xvg


