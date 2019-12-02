FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu16.04

# install basic dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    sudo git wget cmake nano vim gcc g++ build-essential ca-certificates software-properties-common \
    pkg-config zip g++ zlib1g-dev unzip nodejs npm \
    && rm -rf /var/lib/apt/lists/*

# update node
RUN npm install n -g \
    && n stable \
    && apt purge -y nodejs npm

# tensorflow用だが、いらないかも
#RUN wget "https://github.com/bazelbuild/bazel/releases/download/0.25.3/bazel-0.25.3-installer-linux-x86_64.sh" \
#    && chmod +x bazel-0.25.3-installer-linux-x86_64.sh && ./bazel-0.25.3-installer-linux-x86_64.sh --user \
#    && echo 'export PATH="$PATH:$HOME/bin"' >> ~/.bashrc \
#    && exec $SHELL

# install python
RUN add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update \
    && apt-get install -y python3.7 \
    && wget -O ./get-pip.py https://bootstrap.pypa.io/get-pip.py \
    && python3.7 ./get-pip.py \
    && ln -s /usr/bin/python3.7 /usr/local/bin/python3 \
    && ln -s /usr/bin/python3.7 /usr/local/bin/python

# install common python packages
ADD requirements.txt /tmp
RUN pip install pip setuptools -U && pip install --upgrade pip && pip install -r /tmp/requirements.txt

# install pytorch
# https://pytorch.org/
RUN pip install --upgrade pip \
    && pip install https://download.pytorch.org/whl/cu100/torch-1.1.0-cp37-cp37m-linux_x86_64.whl \
    && pip install https://download.pytorch.org/whl/cu100/torchvision-0.3.0-cp37-cp37m-linux_x86_64.whl

# set working directory
WORKDIR /root/user

# jupyter 設定
RUN jupyter notebook --generate-config
COPY jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

# jupyter lab extension install
RUN pip install --upgrade pip && pip install ipywidgets \
    && jupyter nbextension enable --py --sys-prefix widgetsnbextension \
    && jupyter labextension install @jupyterlab/toc \
    && jupyter labextension install @krassowski/jupyterlab_go_to_definition

# 起動時用スクリプト
COPY pytorch_nvidia_test.py /pytorch_nvidia_test.py
COPY run.sh /run.sh

# config and clean up
RUN ldconfig \
    && apt-get -y clean \
    && apt-get -y autoremove