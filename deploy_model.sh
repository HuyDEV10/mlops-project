#!/bin/bash

source mlops-env/bin/activate

mlflow models serve \
  -m models:/IrisClassifier/Production \
  --host 0.0.0.0 \
  --port 1234 \
  --no-conda
