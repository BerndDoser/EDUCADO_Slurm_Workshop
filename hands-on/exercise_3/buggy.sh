#!/bin/bash
#SBATCH --job-name=buggy
#SBATCH --output=buggy_%j.out
#SBATCH --error=buggy_%j.err
#SBATCH --time=48:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=100M
#SBATCH --partition=cascade.q

python sript.py