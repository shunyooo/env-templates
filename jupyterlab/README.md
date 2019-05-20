# jupyterlab



## GCEで立てる

公式の手順を追えば良い

> https://cloud.google.com/community/tutorials/docker-compose-on-container-optimized-os



1. [Container-Optimized OS](https://cloud.google.com/container-optimized-os/)でインスタンスを立てる。
2. dockerでdocker-composeを起動


```bash
docker run docker/compose:1.24.0 version
```

```bash
echo alias dc="'"'docker run --rm \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -v "$PWD:/$PWD" \
      -w="/$PWD" \
      docker/compose:1.24.0'"'" >> ~/.bashrc
source ~/.bashrc
```

```bash
dc up -d --build
```