#!/bin/bash
#project name
#SBATCH -A g2020015
#specify job name
#SBATCH -J YOURJOBNAME
#set places for error and output files
#SBATCH --error=job.%j.err
#SBATCH --output=job.%j.out
#request a certain number of hours for the run HR:MIN:SEC
#SBATCH -t 02:00:00
# specify number of cores you want
#SBATCH -n 20
# specify number of threads per task
#SBATCH -c 1

# It is always best to do a ml purge before loading modules in a submit file
ml purge
ml ABINIT/8.10.3 Armadillo/9.700.2 CDO/1.9.5 GOTM/5.3-221-gac7ec88d NCO/4.8.1 NCO/4.9.2 OpenFOAM/6 OpenFOAM/7 OpenFOAM/v1912 Rosetta/3.7 Siesta/4.1-MaX-1.0 Siesta/4.1-b4 Singular/4.1.2 XCrySDen/1.5.60 XCrySDen/1.6.2 deal.II/9.1.1-gcc deal.II/9.1.1-intel

ml gromacs/2019.6.th

gmx grompp -f nvt.mdp -c em.gro -r em.gro -p topol.top -o nvt.tpr

gmx mdrun -deffnm nvt
