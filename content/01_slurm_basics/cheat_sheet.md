# Slurm Cheat Sheet

## Job Submission
| Command | Description |
| :--- | :--- |
| `sbatch <script>` | Submit a batch script |
| `srun <options> <cmd>` | Run a command interactively or as a step |
| `salloc <options>` | Allocate resources for interactive use |

## Monitoring
| Command | Description |
| :--- | :--- |
| `squeue` | Show all jobs in the queue |
| `squeue -u <user>` | Show jobs for specific user |
| `squeue -j <job_id>` | Show details for a specific job |
| `sinfo` | View cluster state and partitions |
| `scontrol show job <id>` | View detailed info about a running job |

## Job Management
| Command | Description |
| :--- | :--- |
| `scancel <job_id>` | Cancel a specific job |
| `scancel -u <user>` | Cancel ALL jobs for a user (Careful!) |

## Common `sbatch` Directives
Put these at the top of your script (e.g., `#SBATCH --time=1:00:00`)

*   `--job-name=MyJob`: Name of the job
*   `--output=res_%j.out`: STDOUT filename (%j expands to jobID)
*   `--error=err_%j.err`: STDERR filename
*   `--time=DD-HH:MM:SS`: Time limit
*   `--partition=name`: Which queue to use
*   `--nodes=N`: Number of nodes
*   `--ntasks=n`: Number of tasks (processes)
*   `--cpus-per-task=c`: CPU cores per task
*   `--mem=M`: Memory limit (e.g., `4G`)
