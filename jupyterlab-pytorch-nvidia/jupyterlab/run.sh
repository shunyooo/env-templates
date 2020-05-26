#!/bin/sh

# display figlet
figlet -f univers JupyterLab Pytorch Nvidia

# check nvidia gpu
nvidia-smi
python /pytorch_nvidia_test.py

# Start JupyterLab Server
jupyter lab --allow-root --ip 0.0.0.0 --no-browser