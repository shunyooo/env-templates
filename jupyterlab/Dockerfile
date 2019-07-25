FROM ubuntu:16.04

# install basic dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    sudo git wget cmake nano vim gcc g++ build-essential ca-certificates software-properties-common \
    pkg-config zip g++ zlib1g-dev unzip nodejs npm curl iputils-ping net-tools\
    && rm -rf /var/lib/apt/lists/*

# update node
RUN npm install n -g \
    && n stable \
    && apt purge -y nodejs npm

# install python
RUN add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update \
    && apt-get install -y python3.7 \
    && wget -O ./get-pip.py https://bootstrap.pypa.io/get-pip.py \
    && python3.7 ./get-pip.py \
    && ln -s /usr/bin/python3.7 /usr/local/bin/python3 \
    && ln -s /usr/bin/python3.7 /usr/local/bin/python

# install common python packages
COPY requirements.txt /tmp/requirements.txt
RUN pip install pip setuptools -U && pip install --upgrade pip && pip install -r /tmp/requirements.txt

# set working directory
WORKDIR /root/user

# jupyter 設定
RUN jupyter notebook --generate-config
COPY jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

# jupyter lab extension install
RUN pip install --upgrade pip && pip install ipywidgets \
    && jupyter nbextension enable --py --sys-prefix widgetsnbextension \
    && jupyter labextension install @jupyterlab/toc \
    && jupyter labextension install @krassowski/jupyterlab_go_to_definition \
    && jupyter labextension install @lckr/jupyterlab_variableinspector \
    && jupyter labextension install ipyvolume \
    && jupyter labextension install @jupyter-widgets/jupyterlab-manager

# 起動時用スクリプト
COPY run.sh /run.sh

# config and clean up
RUN ldconfig \
    && apt-get -y clean \
    && apt-get -y autoremove