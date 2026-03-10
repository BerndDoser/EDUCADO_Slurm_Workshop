## Exercise 5: Job Arrays

You need to process 5 "datasets" (we'll simulate them). Instead of submitting 5 separate jobs, you'll use a **job array**.

**Submit and monitor**

```bash
sbatch --reservation=aliens_99 array_job.sh
squeue -u $USER
```

**Questions:**

- How many jobs appear in `squeue`? What do the job IDs look like?
- What is the difference between `%A` and `%a` in the output filename?
- After all jobs complete, list the output files. Do you have 5 result files and 5 log files?


## Exercise 5: Job Arrays - Solution

What is the difference between `%A` and `%a` in the output filename?

- `%A` is the job array ID, which is the same for all jobs in the array.
- `%a` is the job array index, which is unique for each job in the array