#!/bin/bash
#SBATCH --job-name=hello_slurm
#SBATCH --output=hello_%j.out
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=100M

echo "Hello from $(hostname)"
echo "Date is $(date)"
echo "My SLURM_JOB_ID is $SLURM_JOB_ID"
