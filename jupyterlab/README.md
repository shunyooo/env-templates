# jupyterlab

<a href='https://hub.docker.com/r/syunyooo/jupyterlab'> ![](https://img.shields.io/docker/cloud/build/syunyooo/jupyterlab.svg?logo=docker&logoColor=white&style=for-the-badge)</a>

## Features

- **jupyterlab**
  - **Ubuntu 16.04**
  - **Python3.7**
- +extensions
  - toc
  - jupyterlab_go_to_definition

## Custom Extension

`FROM syunyooo/jupyterlab`で拡張できます。

以下拡張例

- [jupyterlab-nlp-ja](https://github.com/shunyooo/env-templates/tree/master/jupyterlab-nlp-ja)：日本語の自然言語処理用に拡張

## Quick Start

1. Create `docker-compose.yml` 
2. Copy and paste the following code into a file.

```yaml
version: '3.7'
services:
  jupyterlab:
    image: syunyooo/jupyterlab
    ports:
      - 8888:8888
    volumes:
      - ./work:/root/user/work:cached
    working_dir: /root/user/work
    command: sh /run.sh
    restart: always
    env_file:
      - .env
```

3. Run `docker-compose up`

