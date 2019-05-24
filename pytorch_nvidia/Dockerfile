FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu16.04

# install basic dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    sudo git wget cmake nano vim gcc g++ build-essential ca-certificates software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# install python
RUN add-apt-repository ppa:deadsnakes/ppa \
&& apt-get update \
&& apt-get install -y python3.6 \
&& wget -O ./get-pip.py https://bootstrap.pypa.io/get-pip.py \
&& python3.6 ./get-pip.py \
&& ln -s /usr/bin/python3.6 /usr/local/bin/python3 \
&& ln -s /usr/bin/python3.6 /usr/local/bin/python

# install common python packages
ADD ./requirements.txt /tmp
RUN pip install pip setuptools -U && pip install -r /tmp/requirements.txt

# install pytorch
RUN pip install https://download.pytorch.org/whl/cu100/torch-1.0.0-cp36-cp36m-linux_x86_64.whl \
    torchvision

# set working directory
WORKDIR /root/user

# jupyter 設定
RUN jupyter notebook --generate-config
COPY jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

# 起動時用スクリプト
COPY run.sh /run.sh

# config and clean up
RUN ldconfig \
&& apt-get clean \
&& apt-get autoremove