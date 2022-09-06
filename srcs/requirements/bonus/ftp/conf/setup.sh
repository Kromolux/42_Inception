adduser -D $FTP_USER && addgroup $FTP_USER && adduser $FTP_USER $FTP_USER

passwd -d $FTP_USER $FTP_PASS 

chown -R $FTP_USER:$FTP_USER /home/$FTP_USER/ftp

exec vsftpd