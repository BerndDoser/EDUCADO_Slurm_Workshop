## Exercise 1: Explore the cluster {.smaller}

Run the following commands and answer the questions below:

```bash
sinfo
squeue
scontrol show partition
```

**Questions:**

- How many partitions does the cluster have? What are their names?
- How many nodes are in each partition?
- Are any jobs currently running? How can you tell?
- What is the maximum walltime allowed on the default partition?

::: {.callout-note icon=false}
## Try `sinfo -N -l` for a node-level view and `scontrol show partition <name>` for details on a specific partition.
:::

## Exercise 1: Explore the cluster - Solution {.smaller}

- How many partitions does the cluster have? What are their names?

  cascade.p (default), debug.p, karl.p

- How many nodes are in each partition?

  cascade.p: 148 nodes, debug.p: 2 nodes, karl.p: 1 node

- Are any jobs currently running? How can you tell?

  The `squeue` command shows the jobs in the queue.

- What is the maximum walltime allowed on the default partition?

  cascade.p has a maximum walltime of 24 hours. Default time limit is 2 hours.
    