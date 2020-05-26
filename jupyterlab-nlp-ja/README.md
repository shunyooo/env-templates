# jupyterlab-nlp-ja

<a href='https://hub.docker.com/r/syunyooo/jupyterlab-nlp-ja'> ![](https://img.shields.io/docker/cloud/build/syunyooo/jupyterlab-nlp-ja.svg?logo=docker&logoColor=white&style=for-the-badge)</a>

[jupyterlab](https://github.com/shunyooo/env-templates/tree/master/jupyterlab) の日本語言語処理用の拡張

## Features

- jupyterlab + extensions
  - Ubuntu 16.04
  - Python3.7
- **Japanese NLP**
  - **mecab-ipadic-neologd**
  - **ginza**

## Quick Start

1. Create `docker-compose.yml` 
2. Copy and paste the following code into a file.

```yaml
version: '3.7'
services:
  jupyterlab-nlp-ja:
    image: syunyooo/jupyterlab-nlp-ja
    ports:
      - 8888:8888
    volumes:
      - ./work:/root/user/work:cached
    working_dir: /root/user/work
    command: bash -c "sh /mecab-test.sh && sh /run.sh"
    restart: always
```

3. Run `docker-compose up`

