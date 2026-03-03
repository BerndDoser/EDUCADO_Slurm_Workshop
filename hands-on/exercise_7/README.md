## Prepare Python environment

```bash
module load Python
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

## Usage

```bash
streamflow run streamflow.yml
```
