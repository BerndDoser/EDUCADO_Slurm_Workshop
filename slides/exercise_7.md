## Exercise 7: Streamflow

**Prepare the virtual environment**

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

**Submit the job**

```bash
streamflow run streamflow.yml
```

**Questions:**

- Separate the two steps into two different services. What changes do you need to make in the workflow and deployment definitions?


## Exercise 7: Streamflow - Solution

```yaml
workflows:
  ...
    bindings:
      - step: /say_hello
        target:
          deployment: slurm
          service: cascade
      - step: /train
        target:
          deployment: slurm
          service: cascade-gpu

deployments:
  slurm:
    ...
      services:
        cascade:
          partition: cascade.p
          nodes: "1"
          mem: 1gb
        cascade-gpu:
          partition: cascade.p
          nodes: "1"
          gpus: "1"
          mem: 1gb
```
