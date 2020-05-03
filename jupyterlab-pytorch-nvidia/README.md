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

## Quick Start

1. Create `docker-compose.yml` 
2. Copy and paste the following code into a file.

```yaml
version: '3.7'
services:
  jupyterlab:
    image: syunyooo/jupyterlab-pytorch-nvidia
    ports:
      - 8888:8888
    volumes:
      - ./work:/root/user/work:cached
    working_dir: /root/user/work
    command: sh /run.sh
    restart: always
  tensorboard:
    build: syunyooo/tensorboard
    volumes:
      - ./work/logs:/logs:cached
    working_dir: /logs
    ports:
      - 6006:6006
    environment:
      reload_interval: 2
      log_dir: /logs
    restart: always
```

3. Run `docker-compose up`

