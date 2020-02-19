# env-templates
環境構築系の諸々

| name                                                     | docker-hub                                                   | description                                                  |
| -------------------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| [jupyterlab](./jupyterlab)                               | <a href='https://hub.docker.com/r/syunyooo/jupyterlab'> ![](https://img.shields.io/docker/cloud/build/syunyooo/jupyterlab.svg?logo=docker&logoColor=white&style=for-the-badge)</a> | ubuntu16.04, python3.7, jupyter1.0.0, jupyterlab1.2.6        |
| [jupyterlab-nlp-ja](./jupyterlab-nlp-ja)                 | <a href='https://hub.docker.com/r/syunyooo/jupyterlab-nlp-ja'> ![](https://img.shields.io/docker/cloud/build/syunyooo/jupyterlab-nlp-ja.svg?logo=docker&logoColor=white&style=for-the-badge)</a> | (FROM [jupyterlab](https://github.com/shunyooo/env-templates/tree/master/jupyterlab)), mecab-ipadic-neologd |
| [pytorch-nvidia-jupyterlab](./pytorch-nvidia-jupyterlab) | <a href='https://hub.docker.com/r/syunyooo/pytorch-nvidia-jupyterlab'> ![](https://img.shields.io/docker/cloud/build/syunyooo/pytorch-nvidia-jupyterlab.svg?logo=docker&logoColor=white&style=for-the-badge)</a> | ubuntu16.04, cuda:10.0, cudnn7, python3.7, pytorch1.4.0, jupyterlab1.2.6+ext, tensorboard2.1.0 |

