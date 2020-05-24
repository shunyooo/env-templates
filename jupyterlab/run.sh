#!/bin/sh

# display figlet
figlet -f univers JupyterLab

# Start JupyterLab Server
jupyter lab --allow-root --ip 0.0.0.0 --no-browser