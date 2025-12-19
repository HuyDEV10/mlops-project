#!/bin/bash
set -e

source mlops-env/bin/activate

echo "Deploying model with alias production..."

mlflow models serve \
  -m models:/IrisClassifier@production \
  --port 1234 \
  --no-conda

