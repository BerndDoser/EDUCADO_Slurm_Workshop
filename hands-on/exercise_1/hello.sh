#!/bin/bash
#SBATCH --job-name=hello_world
#SBATCH --output=hello_%j.out
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=100M

echo "=========================================="
echo "  Hello from $(hostname)!"
echo "  Job ID:       $SLURM_JOB_ID"
echo "  Job Name:     $SLURM_JOB_NAME"
echo "  Partition:    $SLURM_JOB_PARTITION"
echo "  Num CPUs:     $SLURM_CPUS_PER_TASK"
echo "  Working Dir:  $(pwd)"
echo "  Date:         $(date)"
echo "=========================================="

sleep 30  # Keep the job alive so you can observe it
echo "Done sleeping. Goodbye!"
