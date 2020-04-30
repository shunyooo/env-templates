# env-templates
環境構築系の諸々

| name                                                     | docker-hub                                                   | size    | description                                                  |
| -------------------------------------------------------- | ------------------------------------------------------------ | ------- | ------------------------------------------------------------ |
| [jupyter-notebook](./jupyter-notebook)                   | <a href='https://hub.docker.com/r/syunyooo/jupyter-notebook'> ![](https://img.shields.io/docker/cloud/build/syunyooo/jupyter-notebook.svg?logo=docker&logoColor=white&style=for-the-badge)</a> | 310MB   | ubuntu16.04, python3.7, jupyter1.0.0                         |
| [jupyterlab](./jupyterlab)                               | <a href='https://hub.docker.com/r/syunyooo/jupyterlab'> ![](https://img.shields.io/docker/cloud/build/syunyooo/jupyterlab.svg?logo=docker&logoColor=white&style=for-the-badge)</a> | 1.5 GB  | ubuntu16.04, python3.7, jupyter1.0.0, jupyterlab1.2.6        |
| [jupyterlab-nlp-ja](./jupyterlab-nlp-ja)                 | <a href='https://hub.docker.com/r/syunyooo/jupyterlab-nlp-ja'> ![](https://img.shields.io/docker/cloud/build/syunyooo/jupyterlab-nlp-ja.svg?logo=docker&logoColor=white&style=for-the-badge)</a> | 2.19 GB | (FROM [jupyterlab](https://github.com/shunyooo/env-templates/tree/master/jupyterlab)), mecab-ipadic-neologd |
| [jupyterlab-pytorch-nvidia](./jupyterlab-pytorch-nvidia) | <a href='https://hub.docker.com/r/syunyooo/jupyterlab-pytorch-nvidia'> ![](https://img.shields.io/docker/cloud/build/syunyooo/jupyterlab-pytorch-nvidia.svg?logo=docker&logoColor=white&style=for-the-badge)</a> | 4.43 GB | ubuntu16.04, cuda:10.0, cudnn7, python3.7, pytorch1.4.0, jupyterlab1.2.6+ext, tensorboard2.1.0 |

