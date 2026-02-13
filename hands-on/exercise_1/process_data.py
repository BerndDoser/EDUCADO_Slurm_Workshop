import sys
import time
import random

task_id = int(sys.argv[1])

# Simulate processing with varying durations
duration = random.uniform(1, 5)
print(f"[Task {task_id}] Processing dataset_{task_id}.csv ...")
time.sleep(duration)

result = task_id ** 2 + 42
print(f"[Task {task_id}] Result: {result}")
print(f"[Task {task_id}] Finished in {duration:.1f}s")

# Save result
with open(f"output_task_{task_id}.txt", "w") as f:
    f.write(f"dataset: {task_id}\nresult: {result}\nduration: {duration:.2f}s\n")

print(f"[Task {task_id}] Saved output_task_{task_id}.txt")
