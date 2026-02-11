#!/bin/bash
#SBATCH --job-name=array_job
#SBATCH --output=array_%A_%a.out
#SBATCH --time=00:05:00
#SBATCH --array=1-10
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=100M

# %A refers to the main job ID, %a refers to the array index

echo "This is task $SLURM_ARRAY_TASK_ID of job $SLURM_ARRAY_JOB_ID"

# Run the python script, passing the array ID as an argument
python3 job_array.py $SLURM_ARRAY_TASK_ID
