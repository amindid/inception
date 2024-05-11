FROM alpine:3.18

#install nginx and openssl
RUN apk update && apk add --no-cache nginx openssl

#creat derectory for nginx
RUN mkdir -p /run/nginx

#remove nginx default configurations
RUN rm -f /etc/nginx/conf.d/*

#copy nginx configuration file
COPY mynginx.conf /etc/nginx/nginx.conf

#copy ssl certificate to nginx certs folder
COPY certificate.pem /etc/nginx/certs/server.pem

#copy ssl private key to nginx private folder
COPY private-key.pem /etc/nginx/private/server.pem

CMD ["nginx", "-g", "daemon off;"]

#expose port
EXPOSE 443 80