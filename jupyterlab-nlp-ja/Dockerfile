FROM syunyooo/jupyterlab
MAINTAINER Shunyo Kawamoto

# mecab
RUN apt-get update && apt-get -y install python3.7-dev curl mecab libmecab-dev mecab-ipadic mecab-ipadic-utf8 file fonts-migmix \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*

# mecab ipadic-neologd
RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git \
    && cd mecab-ipadic-neologd \
    && bin/install-mecab-ipadic-neologd -n -y

# mecab setting
COPY mecabrc /etc/mecabrc

# install python packages
ADD requirements.txt /tmp
RUN pip install pip setuptools -U && pip install --upgrade pip && pip install -r /tmp/requirements.txt

COPY mecab-test.sh /mecab-test.sh