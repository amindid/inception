FROM debian:12.5

RUN apt update -y
RUN apt install -y nginx
RUN apt install -y openssl

COPY ./tools/mynginx.conf /etc/nginx/conf.d/

RUN mkdir /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/aouchaad.key \
    -out /etc/nginx/ssl/aouchaad.crt  \
    -subj "/C=MA/L=Tetouan/O=42/OU=1337 MED/CN=aouchaad.42.fr"

CMD ["nginx", "-g", "daemon off;"]