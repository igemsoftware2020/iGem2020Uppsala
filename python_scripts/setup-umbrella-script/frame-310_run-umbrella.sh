#!/bin/bash

# Short equilibration
grompp -f npt_umbrella.mdp -c conf310.gro -p topol.top -n index.ndx -o npt310.tpr
mdrun -deffnm npt310

# Umbrella run
grompp -f md_umbrella.mdp -c npt310.gro -t npt310.cpt -p topol.top -n index.ndx -o umbrella310.tpr
mdrun -deffnm umbrella310 -pf pullf-umbrella310.xvg -px pullx-umbrella310.xvg


