FROM ubuntu:21.10

RUN addgroup --gid 10001 app
RUN adduser --gid 10001 --uid 10001 \
    --home /app --shell /sbin/nologin \
    --disabled-password app

RUN mkdir /app/
ADD app /app/

USER app
EXPOSE 8080
WORKDIR /app
ENTRYPOINT /app
