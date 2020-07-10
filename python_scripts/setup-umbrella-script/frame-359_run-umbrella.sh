#!/bin/bash

# Short equilibration
grompp -f npt_umbrella.mdp -c conf359.gro -p topol.top -n index.ndx -o npt359.tpr
mdrun -deffnm npt359

# Umbrella run
grompp -f md_umbrella.mdp -c npt359.gro -t npt359.cpt -p topol.top -n index.ndx -o umbrella359.tpr
mdrun -deffnm umbrella359 -pf pullf-umbrella359.xvg -px pullx-umbrella359.xvg


