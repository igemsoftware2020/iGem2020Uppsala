#!/bin/bash

# Short equilibration
grompp -f npt_umbrella.mdp -c conf495.gro -p topol.top -n index.ndx -o npt495.tpr
mdrun -deffnm npt495

# Umbrella run
grompp -f md_umbrella.mdp -c npt495.gro -t npt495.cpt -p topol.top -n index.ndx -o umbrella495.tpr
mdrun -deffnm umbrella495 -pf pullf-umbrella495.xvg -px pullx-umbrella495.xvg


