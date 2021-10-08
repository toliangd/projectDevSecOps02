FROM ubuntu:18.04

RUN addgroup --gid 10001 app
RUN adduser --gid 10001 --uid 10001 \
    --home /microblog/app --shell /sbin/nologin \
    --disabled-password app

ADD app /microblog/app
ADD run.py /microblog
RUN apt update && \
    apt install -y python3 python3-pip curl net-tools && \
    pip3 install flask && \
    chown -R app:app /microblog && \
    chmod 777 /microblog


USER app
EXPOSE 5000:5000
ENTRYPOINT ["python3", "/microblog/run.py"]
