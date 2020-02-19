# jupyterlab-pytorch-nvidia

<a href='https://hub.docker.com/r/syunyooo/jupyterlab-pytorch-nvidia'> ![](https://img.shields.io/docker/cloud/build/syunyooo/jupyterlab-pytorch-nvidia.svg?logo=docker&logoColor=white&style=for-the-badge)</a> 

nvidia gpu 環境ですぐpytorchを回せる環境

## Requirements

- **CUDA10.0**

## Features

- **jupyterlab** +extension
  - **[nvidia/cuda:10.0-cudnn7-devel-ubuntu16.04](https://hub.docker.com/r/nvidia/cuda)**
  - **Python3.7**
  - **Pytorch(latest)**
- **tensorboard**
    - share `tensorboard/logs`  with  `jupyterlab:/root/user/work/logs`

