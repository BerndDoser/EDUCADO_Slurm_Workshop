## Exercise 6: MPI Job

You will compile and run a simple **MPI Hello World** program across multiple tasks.

**Compile the program**

```bash
cd hands-on/exercise_6
mpicc -o mpi_hello mpi_hello.c
```

**Submit the job**

```bash
sbatch --reservation=aliens_99 mpi_job.sh
```

**Questions:**

- How many lines appear in the output file? Does each MPI rank print its message?
- Which ranks run on which node? Do all ranks share the same node or are they spread across nodes?
- Change `--ntasks` to `8` and resubmit. How does the output change?

::: {.callout-note icon=false}
## Use `scontrol show job <jobid>` to verify how many tasks were allocated and on which nodes.
:::


## Exercise 6: MPI Job - Solution

Output:

```bash
Job ID:        18512769
Nodes:         cascade-[127-128]
Total tasks:   4

Hello from rank 0 of 4 on node cascade-127.cluster
Hello from rank 1 of 4 on node cascade-127.cluster
Hello from rank 3 of 4 on node cascade-128.cluster
Hello from rank 2 of 4 on node cascade-128.cluster
```
