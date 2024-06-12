FROM debian:12.5

RUN apt update

RUN apt install vsftpd -y

COPY ./tools/ftp-server.sh .

ENTRYPOINT [ "sh","ftp-server.sh" ]

CMD ["vsftpd", "/etc/vsftpd.conf"]