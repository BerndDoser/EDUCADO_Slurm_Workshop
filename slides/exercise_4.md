## Exercise 4: Experiment with resources

Submit the script `resources.sh` and use `scontrol` to inspect:

```bash
sbatch resources.sh
scontrol show job <jobid>
```

**Questions:**

- Find the `NumCPUs`, `MinMemoryNode`, and `TimeLimit` fields in the `scontrol` output. Do they match what you requested?
- What happens if you request more memory than the node has? Try changing `--mem=9999G` and resubmit. What error do you get?
