FROM debian:12.5

RUN apt update -y
RUN apt install -y nginx
RUN apt install -y openssl

COPY ./tools/mynginx.conf /etc/nginx/conf.d/


#command to generate ssl certificate without the CSR (certificate signing request to be sent to a certificate authority) and without asking for passphrase to encrypt the private key,
RUN mkdir /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/aouchaad.key \
    -out /etc/nginx/ssl/aouchaad.crt  \
    -subj "/C=MA/L=Tetouan/O=42/OU=1337 MED/CN=aouchaad.42.fr"


#command to run nginx server in the foreground
CMD ["nginx", "-g", "daemon off;"]