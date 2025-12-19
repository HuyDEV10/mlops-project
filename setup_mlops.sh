#!/bin/bash
set -e

echo "Updating system..."
sudo apt update && sudo apt upgrade -y

echo "Installing Python and tools..."
sudo apt install -y python3 python3-pip python3-venv git curl 

echo "Creating virtual environment..."
python3 -m venv mlops-env 

echo "Activating virtual environment..."
source mlops-env/bin/activate

echo "Upgrading pip..."
pip install --upgrade pip

echo "Installing MLflow and dependencies..."
pip install mlflow scikit-learn pandas flask gunicorn 

echo "Setup completed!"
