FROM ubuntu:16.04

# install basic dependencies
RUN apt update && apt upgrade -y && apt install -y --no-install-recommends \
    sudo git wget cmake nano vim gcc g++ build-essential ca-certificates software-properties-common \
    pkg-config zip g++ zlib1g-dev unzip nodejs npm curl iputils-ping net-tools\
    && apt clean && rm -rf /var/lib/apt/lists/*

# update node
RUN npm install n -g \
    && n stable \
    && apt purge -y nodejs npm

# install python
RUN add-apt-repository ppa:deadsnakes/ppa \
    && apt update \
    && apt install -y python3.7 python3.7-dev\
    && wget -O ./get-pip.py https://bootstrap.pypa.io/get-pip.py \
    && python3.7 ./get-pip.py \
    && ln -s /usr/bin/python3.7 /usr/local/bin/python3 \
    && ln -s /usr/bin/python3.7 /usr/local/bin/python \
    && apt clean && rm -rf /var/lib/apt/lists/*

# install common python packages + git config
COPY requirements.txt /tmp/requirements.txt
COPY .gitconfig /root/.gitconfig
RUN pip install pip setuptools -U && pip install --upgrade pip && pip install -r /tmp/requirements.txt \
    && nbdime config-git --enable --system

# set working directory
WORKDIR /root/user

# jupyter setting
RUN jupyter notebook --generate-config
COPY jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

# 起動時用スクリプト
COPY run.sh /run.sh

# for GUI
ENV DISPLAY=host.docker.internal:0.0

# config and clean up
RUN ldconfig \
    && apt -y clean \
    && apt -y autoremove
