FROM ubuntu:16.04

# install basic dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    sudo git wget cmake nano vim gcc g++ build-essential ca-certificates software-properties-common \
    pkg-config zip g++ zlib1g-dev unzip nodejs npm curl iputils-ping net-tools\
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
    && apt-get clean && rm -rf /var/lib/apt/lists/*

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
    && jupyter labextension install @jupyterlab/toc --no-build \
    && jupyter labextension install @krassowski/jupyterlab_go_to_definition --no-build \
    && jupyter labextension install ipyvolume --no-build \
    && jupyter labextension install @jupyter-widgets/jupyterlab-manager --no-build \
    && jupyter lab build --minimize False

# 起動時用スクリプト
COPY run.sh /run.sh

# for GUI
ENV DISPLAY=host.docker.internal:0.0

# config and clean up
RUN ldconfig \
    && apt-get -y clean \
    && apt-get -y autoremove