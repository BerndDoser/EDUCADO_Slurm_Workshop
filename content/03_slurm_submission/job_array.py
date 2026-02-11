import sys
import os

def main():
    # Get the task ID from arguments
    # In Slurm, this comes from SLURM_ARRAY_TASK_ID
    
    if len(sys.argv) > 1:
        task_id = int(sys.argv[1])
    else:
        # Fallback if running manually
        task_id = 0
        
    print(f"I am worker {task_id}")
    print(f"Processing data chunk {task_id}...")
    
    # Simulate saving output to a unique file
    output_filename = f"result_{task_id}.txt"
    with open(output_filename, "w") as f:
        f.write(f"Result for task {task_id}\n")
        
    print(f"Saved {output_filename}")

if __name__ == "__main__":
    main()
