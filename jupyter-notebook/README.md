# jupyter-notebook

<a href='https://hub.docker.com/r/syunyooo/jupyter-notebook'> ![](https://img.shields.io/docker/cloud/build/syunyooo/jupyter-notebook.svg?logo=docker&logoColor=white&style=for-the-badge)</a>

## Features

- **Simple jupyter-notebook**
  - **Ubuntu 16.04**
  - **Python3.7**

## Quick Start

1. Create `docker-compose.yml` 
2. Copy and paste the following code into a file.

```yaml
version: '3.7'
services:
  jupyter:
    image: syunyooo/jupyter-notebook
    ports:
      - 8888:8888
    volumes:
      - ./work:/root/user/work:cached
    working_dir: /root/user/work
    command: sh /run.sh
```

3. Run `docker-compose up`

