FROM ubuntu:18.04

RUN addgroup --gid 10001 app
RUN adduser --gid 10001 --uid 10001 \
    --home /microblog --shell /sbin/nologin \
    --disabled-password app

RUN mkdir /microblog/app && apt update && apt install -y python3 python3-pip curl net-tools && pip3 install flask
ADD app /microblog/app
ADD run.py /microblog

USER app
EXPOSE 5000:5000
CMD python3 /microblog/run.py

