#!/bin/bash
if [ ! -d "/var/run/vsftpd/empty" ]; then
	adduser --disabled-password --gecos "" $SYSUSER
	echo "$SYSUSER:$SYSUSERPASS" | chpasswd
	touch /etc/vsftpd.chroot_list;
	echo "$SYSUSER" | tee -a /etc/vsftpd.chroot_list
	chmod 777 /home/$SYSUSER
	mkdir -p /var/run/vsftpd/empty
	chmod -R 555 /var/run/vsftpd/empty
	sed -i 's/#write_enable=YES/write_enable=YES/' /etc/vsftpd.conf
	sed -i 's/#chroot_local_user=YES/chroot_local_user=YES/' /etc/vsftpd.conf
	sed -i "s/#chroot_list_enable=YES/chroot_list_enable=YES/" /etc/vsftpd.conf
	sed -i "s+#chroot_list_file=/etc/vsftpd.chroot_list+chroot_list_file=/etc/vsftpd.chroot_list+" /etc/vsftpd.conf
	sed -i 's/#ftpd_banner=Welcome to blah FTP service./ftpd_banner=Welcome to amine FTP service./' /etc/vsftpd.conf

	mkdir -p /var/www/html/wordpress
	chmod -R 777 /var/www/html/wordpress
	usermod -d /var/www/html/wordpress $SYSUSER
	chown -R $SYSUSER:$SYSUSER /var/www/html/wordpress
	echo "finish script"
fi

exec "$@"