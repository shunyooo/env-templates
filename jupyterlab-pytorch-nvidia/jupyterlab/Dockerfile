FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu16.04

# install basic dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    sudo git wget cmake curl vim gcc g++ build-essential ca-certificates software-properties-common \
    pkg-config zip g++ zlib1g-dev unzip nodejs npm \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

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
    && ln -s /usr/bin/python3.7 /usr/local/bin/python \
    && apt-get python3.7-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# install common python packages & pytorch: https://pytorch.org/ 
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
    && jupyter labextension install @jupyterlab/toc --no-build \
    && jupyter labextension install @krassowski/jupyterlab_go_to_definition --no-build \
    && jupyter labextension install ipyvolume --no-build \
    && jupyter labextension install @jupyter-widgets/jupyterlab-manager --no-build \
    && jupyter labextension install jupyterlab-nvdashboard --no-build \
    && jupyter lab build --minimize False

# jupyter-lab setting
COPY ./jupyterlab-settings /root/.jupyter/lab/user-settings/\@jupyterlab

# 起動時用スクリプト
COPY pytorch_nvidia_test.py /pytorch_nvidia_test.py
COPY run.sh /run.sh

# config and clean up
RUN ldconfig \
    && apt-get -y clean \
    && apt-get -y autoremove
