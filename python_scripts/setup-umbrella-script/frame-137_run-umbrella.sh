#!/bin/bash

# Short equilibration
grompp -f npt_umbrella.mdp -c conf137.gro -p topol.top -n index.ndx -o npt137.tpr
mdrun -deffnm npt137

# Umbrella run
grompp -f md_umbrella.mdp -c npt137.gro -t npt137.cpt -p topol.top -n index.ndx -o umbrella137.tpr
mdrun -deffnm umbrella137 -pf pullf-umbrella137.xvg -px pullx-umbrella137.xvg


