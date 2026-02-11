import dask.array as da
import time
import os

def main():
    # Dask creates a logical graph of computations and executes them lazily.
    # It can handle arrays larger than memory by chunking them.
    
    # 1. Create a large random array (lazy)
    # chunks defines the size of the blocks
    x = da.random.random((10000, 10000), chunks=(1000, 1000))
    
    print(f"Array size in GB: {x.nbytes / 1e9:.2f} GB")
    
    # 2. Perform computation
    y = x + x.T
    z = y.mean(axis=0)
    
    # No computation happened yet!
    print("Graph constructed. Computing...")
    
    start = time.time()
    # .compute() triggers the actual calculation
    result = z.compute() 
    
    print(f"Computation finished in {time.time() - start:.2f}s")
    print(f"Result shape: {result.shape}")

if __name__ == "__main__":
    # Dask uses threads by default for arrays. 
    # You can configure it to use processes if needed.
    print(f"Running on process {os.getpid()}")
    main()
