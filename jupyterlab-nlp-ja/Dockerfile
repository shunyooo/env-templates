FROM syunyooo/jupyterlab
MAINTAINER v-crn

# mecab
RUN apt update && apt -y install python3.7-dev curl mecab libmecab-dev mecab-ipadic mecab-ipadic-utf8 file fonts-migmix \
	&& apt clean && rm -rf /var/lib/apt/lists/*

# mecab ipadic-neologd
RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git \
    && cd mecab-ipadic-neologd \
    && bin/install-mecab-ipadic-neologd -n -y

# mecab setting
COPY mecabrc /etc/mecabrc

# install python packages
ADD requirements.txt /tmp
RUN pip install pip setuptools -U && pip install --upgrade pip && pip install -r /tmp/requirements.txt

# run scripts
COPY run.sh /run.sh
COPY parser-test.sh /parser-test.sh

CMD ["sh", "/parser-test.sh", "&&", "sh", "/run.sh"]
