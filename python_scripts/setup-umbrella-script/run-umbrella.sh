#!/bin/bash
#project name
#SBATCH -A youraccount
#specify job name
#SBATCH -J SM_umbrella_sampling_XXX
#set places for error and output files
#SBATCH --error=job.%j_umbrella_sampling_XXX.err
#SBATCH --output=job.%j_umbrella_sampling_XXX.out
#request a certain number of hours for the run HR:MIN:SEC
#SBATCH -t 3-00:00:00
# specify number of cores you want
#SBATCH -n 20
# specify number of threads per task
#SBATCH -c 1

#ensure your batch file is run from the location that contains all the files
#produced from previous steps

# It is always best to do a ml purge before loading modules in a submit file
ml purge
ml ABINIT/8.10.3 Armadillo/9.700.2 CDO/1.9.5 GOTM/5.3-221-gac7ec88d NCO/4.8.1 NCO/4.9.2 OpenFOAM/6 OpenFOAM/7 OpenFOAM/v1912 Rosetta/3.7 Siesta/4.1-MaX-1.0 Siesta/4.1-b4 Singular/4.1.2 XCrySDen/1.5.60 XCrySDen/1.6.2 deal.II/9.1.1-gcc deal.II/9.1.1-intel

ml gromacs/2019.6.th


# Automatic selection of single or multi node based GROMACS
if [ $SLURM_JOB_NUM_NODES -gt 1 ]; then
    GMX="gmx_mpi"
    MPIRUN="mpirun"
    ntmpi=""
else
    GMX="gmx"
    MPIRUN=""
    ntmpi="-ntmpi $SLURM_NTASKS"
fi

# Automatic selection of ntomp argument based on "-c" argument to sbatch
if [ -n "$SLURM_CPUS_PER_TASK" ]; then
    ntomp="$SLURM_CPUS_PER_TASK"
else
    ntomp="1"
fi
# Make sure to set OMP_NUM_THREADS equal to the value used for ntomp
# to avoid complaints from GROMACS
export OMP_NUM_THREADS=$ntomp


# Short equilibration
gmx grompp -f npt_umbrella.mdp -c confXXX.gro -r confXXX.gro -p topol.top -n index.ndx -o nptXXX.tpr -maxwarn 2
$MPIRUN $GMX mdrun $ntmpi -ntomp $ntomp -deffnm nptXXX

# Umbrella run
gmx grompp -f md_umbrella.mdp -c nptXXX.gro -r nptXXX.gro -t nptXXX.cpt -p topol.top -n index.ndx -o umbrellaXXX.tpr -maxwarn 2
$MPIRUN $GMX mdrun $ntmpi -ntomp $ntomp -deffnm umbrellaXXX
