FROM debian:12.5

RUN apt update

RUN apt install -y redis-server

COPY ./tools/redis.sh .

RUN chmod +x redis.sh

ENTRYPOINT [ "sh", "redis.sh" ]

CMD ["redis-server"]