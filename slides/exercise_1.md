## Exercise 1: Explore the cluster

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

::: {.callout-note icon=false}
## Try `sinfo -N -l` for a node-level view and `scontrol show partition <name>` for details on a specific partition.
:::
