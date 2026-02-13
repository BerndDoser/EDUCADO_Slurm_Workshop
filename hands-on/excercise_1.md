# Exercise 1: Mission Control — Your First Slurm Adventure

> **Scenario:** You just got access to the cluster. Your PI says: *"Run some jobs, figure it out."*
> Challenge accepted. Let's go from zero to cluster hero.

---

## Part A: Recon — Know Your Cluster

Before submitting anything, a good astronaut checks the instruments.

### Task A1: Explore the cluster

Run the following commands and answer the questions below:

```bash
sinfo
squeue
scontrol show partition
```

**Questions:**

1. How many partitions does the cluster have? What are their names?
2. How many nodes are in each partition?
3. Are any jobs currently running? How can you tell?
4. What is the maximum walltime allowed on the default partition?

> **Hint:** Try `sinfo -N -l` for a node-level view and `scontrol show partition <name>` for details on a specific partition.

---

## Part B: Hello, Cluster!

### Task B1: Write your first batch script

Create a file called `hello.sh` with the following content:

```bash
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
```

### Task B2: Submit and observe

```bash
sbatch hello.sh
```

Now **quickly** (within 30 seconds!) run:

```bash
squeue -u $USER
```

**Questions:**

5. What is your job ID?
6. What state is your job in? (`PD` = pending, `R` = running, `CG` = completing)
7. On which node is it running?

After the job completes, inspect the output:

```bash
cat hello_<jobid>.out
```

8. Does the hostname match what `squeue` reported?

---

## Part C: Oops! — Debug a Broken Script

Every cluster user will eventually submit a broken job. Let's practice diagnosing one.

### Task C1: Submit the buggy script

Create a file called `buggy.sh`:

```bash
#!/bin/bash
#SBATCH --job-name=buggy
#SBATCH --output=buggy_%j.out
#SBATCH --error=buggy_%j.err
#SBATCH --time=00:01:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=100M
#SBATCH --partition=nonexistent_partition

echo "You will never see this."
python3 this_script_does_not_exist.py
```

Try to submit it:

```bash
sbatch buggy.sh
```

**Questions:**

9. Did the job submit successfully? What error did you get?
10. Fix the `--partition` line (use a valid partition from Part A) and resubmit. What happens now?
11. After it runs, check both `.out` and `.err` files. What error do you see?
12. How would you fix the Python error?

---

## Part D: Resource Requests — Size Matters

Requesting the right resources is a critical skill. Too little and your job crashes. Too much and it sits in the queue forever.

### Task D1: Experiment with resources

Create `resources.sh`:

```bash
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

# Show actual CPU info available
nproc
lscpu | grep "^CPU(s):"

# Check memory
free -h

echo "Job completed at $(date)"
```

Submit it, then use `scontrol` to inspect:

```bash
sbatch resources.sh
scontrol show job <jobid>
```

**Questions:**

13. Find the `NumCPUs`, `MinMemoryNode`, and `TimeLimit` fields in the `scontrol` output. Do they match what you requested?
14. What happens if you request more memory than the node has? Try changing `--mem=9999G` and resubmit. What error do you get?

---

## Part E: The Grand Finale — Job Arrays

You need to process 5 "datasets" (we'll simulate them). Instead of submitting 5 separate jobs, you'll use a **job array**.

### Task E1: Create the processing script

Create `process_data.py`:

```python
import sys
import time
import random

task_id = int(sys.argv[1])

# Simulate processing with varying durations
duration = random.uniform(1, 5)
print(f"[Task {task_id}] Processing dataset_{task_id}.csv ...")
time.sleep(duration)

result = task_id ** 2 + 42
print(f"[Task {task_id}] Result: {result}")
print(f"[Task {task_id}] Finished in {duration:.1f}s")

# Save result
with open(f"output_task_{task_id}.txt", "w") as f:
    f.write(f"dataset: {task_id}\nresult: {result}\nduration: {duration:.2f}s\n")

print(f"[Task {task_id}] Saved output_task_{task_id}.txt")
```

### Task E2: Create the array submission script

Create `array_job.sh`:

```bash
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
```

### Task E3: Submit and monitor

```bash
sbatch array_job.sh
squeue -u $USER
```

**Questions:**

15. How many jobs appear in `squeue`? What do the job IDs look like?
16. What is the difference between `%A` and `%a` in the output filename?
17. After all jobs complete, list the output files. Do you have 5 result files and 5 log files?

```bash
ls output_task_*.txt
cat output_task_*.txt
```

---

## Bonus Challenge: The Completionist

If you finished early, try these:

- **Cancel a running job:** Submit `hello.sh` again and cancel it with `scancel <jobid>` before it finishes. Check the output — what happened?
- **Email notifications:** Add `#SBATCH --mail-type=END` and `#SBATCH --mail-user=your@email.com` to a script. Did you get an email when it completed?
- **Job dependency:** Submit two jobs where the second only runs after the first succeeds:
  ```bash
  JOB1=$(sbatch --parsable hello.sh)
  sbatch --dependency=afterok:$JOB1 hello.sh
  ```
  Use `squeue` to observe the second job waiting in state `PD` with reason `Dependency`.
- **Custom array ranges:** Modify `array_job.sh` to only run tasks 1, 3, and 5 using `--array=1,3,5`. Verify only those outputs are created.

---

## Cheat Sheet Quick Reference

| What you want to do             | Command                          |
| :------------------------------ | :------------------------------- |
| Submit a job                    | `sbatch script.sh`               |
| Check your jobs                 | `squeue -u $USER`                |
| Cancel a job                    | `scancel <jobid>`                |
| See job details                 | `scontrol show job <jobid>`      |
| View cluster info               | `sinfo`                          |
| Get an interactive session      | `srun --pty bash`                |
| Check past jobs (if available)  | `sacct -u $USER --starttime=today` |

---

**Congratulations!** You've explored the cluster, submitted batch jobs, debugged errors, managed resources, and launched job arrays. You're ready for the real thing.
