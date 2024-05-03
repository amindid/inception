FROM alpine:3.18

#install nginx and openssl
RUN apt-get update && apt-get install nginx openssl

#creat derectory for nginx
RUN mkdir -p /run/nginx

#remove nginx default configurations
RUN rm /etc/nginx/conf.d/*

#copy nginx configuration file
COPY mynginx.conf /etc/nginx/nginx.conf

#expose port
EXPOSE 443