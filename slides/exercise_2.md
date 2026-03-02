## Exercise 2: Write your first batch script {.smaller}

Submit and observe

```bash
sbatch hello.sh
```

Now **quickly** (within 30 seconds!) run:

```bash
squeue -u $USER
```

**Questions:**

- What is your job ID?
- What state is your job in? (`PD` = pending, `R` = running, `CG` = completing)
- On which node is it running?

After the job completes, inspect the output:

```bash
cat hello_<jobid>.out
```

- Does the hostname match what `squeue` reported?