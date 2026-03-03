#!/usr/bin/env python

import argparse
import sys

from sklearn.datasets import load_wine
from sklearn.linear_model import LogisticRegression

parser = argparse.ArgumentParser()
parser.add_argument(
    "--max_iter", type=int, required=True, help="Maximum number of iterations"
)

args = parser.parse_args(sys.argv[1:])
print("Max iter:", args.max_iter)

data = load_wine(as_frame=True).frame
data.assign(target=lambda x: x["target"].where(x["target"] == 0, 1))

features = data.drop("target", axis="columns")
target = data["target"]

result = LogisticRegression(max_iter=args.max_iter).fit(features, target)
print("Score: ", result.score(features, target))
