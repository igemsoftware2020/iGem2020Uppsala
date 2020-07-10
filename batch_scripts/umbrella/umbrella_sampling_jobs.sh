# loop over all umbrella files in the directory, print the filename and submit the jobs to SLURM
#

for FILE in *_run-umbrella.sh; do
    echo ${FILE}
    sbatch ${FILE}
    sleep 1 # pause to be kind to the scheduler
done
