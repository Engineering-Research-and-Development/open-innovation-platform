FROM python:3.9.13-bullseye
LABEL version="0.1"

RUN apt-get update

RUN pip install requests

RUN mkdir /app

COPY . /app

WORKDIR /app

ENTRYPOINT ["python3", "main.py"]
