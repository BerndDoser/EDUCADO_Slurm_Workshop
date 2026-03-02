#!/bin/bash
#SBATCH --job-name=mpi_hello
#SBATCH --output=mpi_hello_%j.out
#SBATCH --time=00:05:00
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=2
#SBATCH --mem-per-cpu=100M

echo "Job ID:        $SLURM_JOB_ID"
echo "Nodes:         $SLURM_JOB_NODELIST"
echo "Total tasks:   $SLURM_NTASKS"
echo ""

. cascade-gompi-2025b.sh

#srun ./mpi_hello

mpirun --bind-to none ./mpi_hello
