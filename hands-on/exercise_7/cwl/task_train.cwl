cwlVersion: v1.2

class: CommandLineTool
baseCommand: [python]

inputs:
  train_script:
    type: File
    doc: The script containing the training logic
    inputBinding:
      position: 1
  max_iter:
    type: int
    doc: Maximum number of iterations
    inputBinding:
      position: 2
      prefix: --max_iter

outputs: {}