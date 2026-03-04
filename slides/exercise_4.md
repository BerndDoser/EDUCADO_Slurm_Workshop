## Exercise 4: Experiment with resources {.smaller}

Submit the script `resources.sh` and use `scontrol` to inspect:

```bash
sbatch --reservation=aliens_99 resources.sh
scontrol show job <jobid>
```

**Questions:**

- Find the `NumCPUs`, `MinMemoryNode`, and `TimeLimit` fields in the `scontrol` output. Do they
  match what you requested?
- What happens if you request more memory than the node has? Try changing `--mem=9999G` and
  resubmit. What error do you get?
- Request 1 and 2 GPUs and check the output of `nvidia-smi` in the job. Do you see the expected
  number of GPUs allocated to your job?


## Exercise 4: Resources - Solution

scontrol output with `--mem=512M`:
```bash
RunTime=00:00:20 TimeLimit=00:02:00 TimeMin=N/A
NumNodes=1 NumCPUs=2 NumTasks=1 CPUs/Task=2 ReqB:S:C:T=0:0:*:*
MinCPUsNode=2 MinMemoryNode=512M MinTmpDiskNode=0
```

--mem=9999G:
```bash
sbatch: error: Memory specification can not be satisfied
sbatch: error: Batch job submission failed: Requested node configuration is not available
```

## nvidia-smi output with `--gres=gpu:1`:

```
+-----------------------------------------------------------------------------------------+
| NVIDIA-SMI 565.57.01              Driver Version: 565.57.01      CUDA Version: 12.7     |
|-----------------------------------------+------------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id          Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |           Memory-Usage | GPU-Util  Compute M. |
|                                         |                        |               MIG M. |
|=========================================+========================+======================|
|   0  NVIDIA GeForce RTX 2080 ...    On  |   00000000:17:00.0 Off |                  N/A |
| 30%   29C    P8             16W /  250W |       1MiB /   8192MiB |      0%      Default |
|                                         |                        |                  N/A |
+-----------------------------------------+------------------------+----------------------+
```
