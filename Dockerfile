FROM ubuntu:18.04

RUN addgroup --gid 10001 app
RUN adduser --gid 10001 --uid 10001 \
    --home /app --shell /sbin/nologin \
    --disabled-password app

RUN mkdir /microblog
ADD app /microblog

RUN chown app /microblog

USER app
EXPOSE 8080
WORKDIR /microblog
ENTRYPOINT /microblog
