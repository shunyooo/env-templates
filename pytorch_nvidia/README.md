# pytorch_nvidia



## GCEで立てる

#### 1. インスタンス起動

VMのMarketPlaceからnvidia-docker系のやつでインスタンスを立てる。

> [MarketPlace検索「nvidia docker」](https://console.cloud.google.com/compute/instances?hl=ja&instancessize=50&duration=PT1H&subtask=browse&filter=solution-type:vm&subtaskIndex=2&q=docker%20nvidia)
>
> ![image-20190527171444955](http://ww2.sinaimg.cn/large/006tNc79gy1g3fy4hsqpmj311a0l2afb.jpg)

外部IPはメモっておく。

#### 2. ファイアーウォール設定

起動時に指定

<img src='http://ww3.sinaimg.cn/large/006tNc79gy1g3fy4gm0ygj30mb06jjrx.jpg' width=500 />

ネットワークタグに開放するポート情報が紐づいているので、「[VPCネットワーク > ファイアーウォール ルール](https://console.cloud.google.com/networking/firewalls/list?hl=ja&firewallTablesize=50)」でその紐づけを行う。以下の場合だと`8888`ポート。

![image-20190527172341622](http://ww1.sinaimg.cn/large/006tNc79gy1g3fyartw1nj30y60u0di9.jpg)

#### 3. docker-compose起動

sshして、dockerコンテナの起動まで行う。

1. git clone
2. docker-compose install
3. docker-compose up

の順で行う。

```bash
# 1. git clone
git clone https://github.com/shunyooo/env-templates.git

# 2. docker-compose install
# 参考: https://docs.docker.com/compose/install/
# versionを指定するので最新を確認する必要あり。
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo docker-compose --version
# docker-compose version 1.24.0, build 0aa59064

# 3. docker-compose up
cd env-templates/pytorch_nvidia/
sudo docker-compose up
```



#### 動作確認

ブラウザで`{外部IP}:8888`を開く。

![image-20190527175542810](http://ww4.sinaimg.cn/large/006tNc79gy1g3fz80objjj31280u0du9.jpg)

GPUが認識できていることを確認。

