#!/bin/bash

sed -i 's/#write_enable=YES/write_enable=YES/' /etc/vsftpd.conf
sed -i 's/#ftpd_banner=Welcome to blah FTP service./ftpd_banner=Welcome to amine FTP service./' /etc/vsftpd.conf