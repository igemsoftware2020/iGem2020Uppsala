#!/bin/bash

# Short equilibration
grompp -f npt_umbrella.mdp -c conf202.gro -p topol.top -n index.ndx -o npt202.tpr
mdrun -deffnm npt202

# Umbrella run
grompp -f md_umbrella.mdp -c npt202.gro -t npt202.cpt -p topol.top -n index.ndx -o umbrella202.tpr
mdrun -deffnm umbrella202 -pf pullf-umbrella202.xvg -px pullx-umbrella202.xvg


