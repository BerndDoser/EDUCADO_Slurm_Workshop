# Scaling Python with Slurm: From Laptop to Cluster

Welcome to this workshop on using Slurm for High Performance Computing (HPC) with Python. This workshop is designed to take you from running scripts on your local machine to scaling them up on a Slurm-managed cluster.

## Workshop Agenda

1.  **[Part 1: Slurm Basics](./01_slurm_basics/README.md)**
    *   Understanding HPC Clusters
    *   Key Slurm Commands (`sinfo`, `squeue`, `sbatch`)
    *   Partitions and Resources

2.  **[Part 2: Python Parallel Programming Pattern](./02_python_parallelism/README.md)**
    *   Why parallelize?
    *   `multiprocessing`: The standard library approach
    *   `joblib`: Simple parallel loops
    *   `dask`: Scaling arrays and dataframes

3.  **[Part 3: Running on Slurm](./03_slurm_submission/README.md)**
    *   Writing your first submission script
    *   Managing Python environments (conda/venv)
    *   **Job Arrays**: The secret weapon for data science workflows

## Prerequisites

*   Basic knowledge of Python.
*   Access to a terminal.
*   Access to a Slurm cluster (optional for the Python part, required for the Slurm part).

## Getting Started

Clone this repository to your cluster home directory:

```bash
git clone <repository_url>
cd educado
```

## Resources

*   [Slurm Documentation](https://slurm.schedmd.com/documentation.html)
*   [Python Multiprocessing Docs](https://docs.python.org/3/library/multiprocessing.html)
*   [Joblib Documentation](https://joblib.readthedocs.io/en/latest/)
