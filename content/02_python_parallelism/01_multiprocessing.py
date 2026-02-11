import multiprocessing
import time
import os

def heavy_computation(x):
    """
    A function that simulates work.
    """
    print(f"Process {os.getpid()} processing {x}")
    # Simulate CPU work
    result = sum(i * i for i in range(10**6))
    return x * x

def main():
    # Number of cores to use
    # On a shared cluster login node, DO NOT use cpu_count() blindly!
    # Hardcode or use environment variables.
    
    # Slurm sets SLURM_CPUS_PER_TASK if you use --cpus-per-task
    cpus = int(os.environ.get('SLURM_CPUS_PER_TASK', 4))
    print(f"Using {cpus} cores")

    data = list(range(10))

    # Create a pool of workers
    with multiprocessing.Pool(processes=cpus) as pool:
        results = pool.map(heavy_computation, data)

    print(f"Results: {results}")

if __name__ == "__main__":
    start_time = time.time()
    main()
    print(f"Total time: {time.time() - start_time:.2f} seconds")
