
## Part E: The Grand Finale — Job Arrays

You need to process 5 "datasets" (we'll simulate them). Instead of submitting 5 separate jobs, you'll use a **job array**.

### Task E1: Create the processing script

### Task E2: Create the array submission script

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
