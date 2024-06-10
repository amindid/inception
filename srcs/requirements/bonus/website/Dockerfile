FROM debian:12.5

RUN apt update -y

RUN apt install -y nginx

RUN rm -rf /var/www/html/*

COPY ./tools/* /var/www/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
