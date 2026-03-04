#!/bin/bash
#SBATCH --job-name=resource_test
#SBATCH --output=resources_%j.out
#SBATCH --time=00:02:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=512M

echo "CPUs allocated: $SLURM_CPUS_PER_TASK"
echo "Memory requested: $SLURM_MEM_PER_NODE MB"
echo "Node: $(hostname)"

sleep 30  # Keep the job alive so you can observe it
echo "Done sleeping. Goodbye!"
