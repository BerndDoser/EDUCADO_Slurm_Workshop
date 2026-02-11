# Part 3: Running on Slurm

This directory contains examples of how to submit jobs to the cluster.

## Files
*   `basic_job.sh`: A minimal example printing hostname and date.
*   `python_job.sh`: How to run the Python scripts from Part 2.
*   `job_array.sh`: Submitting multiple similar jobs with one script.
*   `job_array.py`: The Python script corresponding to the array example.

## How to use
Run:
```bash
sbatch basic_job.sh
```
Then check status with `squeue -u <your_username>`.
