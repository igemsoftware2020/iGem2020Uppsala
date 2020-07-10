#!/bin/bash

# Short equilibration
grompp -f npt_umbrella.mdp -c conf92.gro -p topol.top -n index.ndx -o npt92.tpr
mdrun -deffnm npt92

# Umbrella run
grompp -f md_umbrella.mdp -c npt92.gro -t npt92.cpt -p topol.top -n index.ndx -o umbrella92.tpr
mdrun -deffnm umbrella92 -pf pullf-umbrella92.xvg -px pullx-umbrella92.xvg


