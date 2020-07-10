#!/bin/bash

# Short equilibration
grompp -f npt_umbrella.mdp -c conf68.gro -p topol.top -n index.ndx -o npt68.tpr
mdrun -deffnm npt68

# Umbrella run
grompp -f md_umbrella.mdp -c npt68.gro -t npt68.cpt -p topol.top -n index.ndx -o umbrella68.tpr
mdrun -deffnm umbrella68 -pf pullf-umbrella68.xvg -px pullx-umbrella68.xvg


