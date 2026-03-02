#!/bin/bash
#SBATCH --job-name=data_processing
#SBATCH --output=array_%A_%a.out
#SBATCH --time=00:05:00
#SBATCH --array=1-5
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=100M

echo "Array Job ID: $SLURM_ARRAY_JOB_ID"
echo "Array Task ID: $SLURM_ARRAY_TASK_ID"
echo "Running on: $(hostname)"

python3 process_data.py $SLURM_ARRAY_TASK_ID
