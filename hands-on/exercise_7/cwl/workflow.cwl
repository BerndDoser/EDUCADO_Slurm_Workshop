#!/usr/bin/env cwl-runner

cwlVersion: v1.2
class: Workflow

inputs:
  message:
    type: string
  train_script:
    type: File
  max_iter:
    type: int

outputs: {}

steps:
  say_hello:
    run: task_say_hello.cwl
    in:
      message: message
    out: []
  train:
    run: task_train.cwl
    in:
      max_iter: max_iter
      train_script: train_script
    out: []
