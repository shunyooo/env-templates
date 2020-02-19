FROM python:3.5-slim

RUN pip install pip setuptools -U && pip install --upgrade pip && pip install -U tensorflow tensorboard

WORKDIR /logs

ENTRYPOINT ["tensorboard", "--logdir", "/logs", "--bind_all"]
CMD []

