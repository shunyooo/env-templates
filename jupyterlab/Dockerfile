FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

# install basic dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    sudo git wget cmake nano vim gcc g++ build-essential ca-certificates software-properties-common \
    pkg-config zip g++ zlib1g-dev unzip nodejs npm curl iputils-ping net-tools figlet python3-distutils\
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# install figlet fonts
RUN wget ftp://ftp.figlet.org/pub/figlet/fonts/contributed.tar.gz \
    && gunzip -dc ./contributed.tar.gz | tar vfx - \
    && find ./contributed -type f \( -name '*.flf' -or -name '*.flc' \) -exec sudo /bin/cp {} /usr/share/figlet/ \; \
    && rm -rf contributed.tar.gz contributed

# update node
RUN npm install n -g \
    && n stable \
    && apt purge -y nodejs npm

# install python
RUN add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update \
    && apt-get install -y python3.9 python3.9-dev\
    && wget -O ./get-pip.py https://bootstrap.pypa.io/get-pip.py \
    && python3.9 ./get-pip.py \
    && ln -s /usr/bin/python3.9 /usr/local/bin/python3 \
    && ln -s /usr/bin/python3.9 /usr/local/bin/python \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# install common python packages + git config
COPY requirements.txt /tmp/requirements.txt
COPY .gitconfig /root/.gitconfig
RUN pip install pip setuptools -U && pip install --upgrade pip && pip install -r /tmp/requirements.txt \
    && nbdime config-git --enable --system

# set working directory
WORKDIR /root/user

# jupyter-lab extension install
COPY install_labextensions.sh /tmp/install_labextensions.sh
RUN sh /tmp/install_labextensions.sh

# jupyter setting
RUN jupyter notebook --generate-config
COPY jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

# jupyter-lab setting
COPY ./jupyterlab-settings /root/.jupyter/lab/user-settings/\@jupyterlab

# 起動時用スクリプト
COPY run.sh /run.sh

# for GUI
ENV DISPLAY=host.docker.internal:0.0

# config and clean up
RUN ldconfig \
    && apt-get -y clean \
    && apt-get -y autoremove

CMD ["sh", "/run.sh"]
