## Exercise 6: MPI Job

You will compile and run a simple **MPI Hello World** program across multiple tasks.

**Compile the program**

```bash
cd hands-on/exercise_6
mpicc -o mpi_hello mpi_hello.c
```

**Submit the job**

```bash
sbatch mpi_job.sh
```

**Questions:**

- How many lines appear in the output file? Does each MPI rank print its message?
- Which ranks run on which node? Do all ranks share the same node or are they spread across nodes?
- Change `--ntasks` to `8` and resubmit. How does the output change?
- What happens if you replace `srun` with `mpirun` in the script? Is there a difference on your cluster?

::: {.callout-note icon=false}
## Use `scontrol show job <jobid>` to verify how many tasks were allocated and on which nodes.
:::
