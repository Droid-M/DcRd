#!/bin/bash

# Virtual environment name
env_name="venv"

# Create virtual environment
python3 -m venv $env_name

# Activate virtual environment
source $env_name/bin/activate

# Install dependencies, if requirements.txt exists
if [[ -f "requirements.txt" ]]; then
    pip install -r requirements.txt
else
    echo "requirements.txt file not found. Virtual environment created without additional packages."
fi

echo "Virtual environment ready. To activate it, run:"
echo "source $env_name/bin/activate"

