# Part 2: Python Parallel Programming

Python runs on a single core by default due to the Global Interpreter Lock (GIL). To utilize the full power of an HPC node (which might have 40+ cores), we need to use libraries that support multiprocessing.

## Concepts

1.  **Embarrassingly Parallel**: Tasks that are completely independent (e.g., processing 1000 images, running 100 separate simulations). These are easiest to scale.
2.  **Shared Memory**: Multiple processors accessing the same memory (single node).
3.  **Distributed Memory**: Processors checking explicitly across network (multiple nodes) - *often handled by MPI or Dask*.

## Examples provided

1.  `01_multiprocessing.py`: Uses the built-in `multiprocessing` library. Good for strict control.
2.  `02_joblib.py`: The easiest way to parallelize a for-loop. Recommended for beginners and scikit-learn users.
3.  `03_dask_intro.py`: For handling large datasets that don't fit in memory.

## Running these
You can run these directly on the login node (for very small tests) or inside an `srun` interactive session.
