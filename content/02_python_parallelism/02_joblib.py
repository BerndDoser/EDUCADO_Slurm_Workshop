from joblib import Parallel, delayed
import time
import math
import os

def compute_factorial(n):
    """
    Compute factorial to simulate work
    """
    print(f"Task {n} running on PID {os.getpid()}")
    time.sleep(1) # Sleep to make parallelism obvious
    return math.factorial(n)

def main():
    # Joblib detects CPUs automatically, but in Slurm we should be careful.
    # n_jobs=-1 uses all available.
    # On a cluster, it respects affinity if set properly, but explicit is better.
    
    n_jobs = int(os.environ.get('SLURM_CPUS_PER_TASK', 2))
    print(f"Running with n_jobs={n_jobs}")

    inputs = range(10)
    
    # Simple parallel loop
    results = Parallel(n_jobs=n_jobs)(delayed(compute_factorial)(i) for i in inputs)
    
    print(f"Results: {results}")

if __name__ == "__main__":
    start = time.time()
    main()
    print(f"Done in {time.time() - start:.2f}s")
