#!/bin/bash

# Short equilibration
grompp -f npt_umbrella.mdp -c conf266.gro -p topol.top -n index.ndx -o npt266.tpr
mdrun -deffnm npt266

# Umbrella run
grompp -f md_umbrella.mdp -c npt266.gro -t npt266.cpt -p topol.top -n index.ndx -o umbrella266.tpr
mdrun -deffnm umbrella266 -pf pullf-umbrella266.xvg -px pullx-umbrella266.xvg


