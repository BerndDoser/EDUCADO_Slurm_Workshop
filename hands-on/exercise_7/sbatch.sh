#!/bin/bash

module load Python
. .venv/bin/activate

{{streamflow_command}}
