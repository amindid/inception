FROM debian:12.5

#install nginx and openssl
RUN apt-get update && apt-get install -y nginx openssl


#copy nginx configuration file
COPY ./tools/mynginx.conf /etc/nginx/nginx.conf

RUN mkdir /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/aouchaad.key \
    -out /etc/nginx/ssl/aouchaad.crt  \
    -subj "/C=MA/L=Tetouan/O=42/OU=1337 MED/CN=aouchaad.42.fr"

CMD ["nginx", "-g", "daemon off;"]