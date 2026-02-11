#!/bin/bash
#SBATCH --job-name=py_parallel
#SBATCH --output=py_%j.out
#SBATCH --time=00:10:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=2G

# Load your python module if needed, e.g.:
# module load python/3.9
# or
# source ~/myenv/bin/activate

echo "Running on $(hostname) with $SLURM_CPUS_PER_TASK cores"

# Move to the script location if needed
# cd ../02_python_parallelism

echo "--- Running Multiprocessing Example ---"
python3 ../02_python_parallelism/01_multiprocessing.py

echo "--- Running Joblib Example ---"
python3 ../02_python_parallelism/02_joblib.py
