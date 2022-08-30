#CREATE DATABASE IF NOT EXISTS DataBase;
#CREATE USER IF NOT EXISTS 'rkaufman'@'%' IDENTIFIED BY 'IwantYourData';
#--GRANT ALL PRIVILEGES ON DataBase.* TO 'rkaufman'@'%';
#FLUSH PRIVILEGES;
#--ALTER USER 'root'@'localhost' IDENTIFIED BY 'MasterOfDesaster';


#mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
#mariadb-install-db --user=root --basedir=/usr --datadir=/var/lib/mysql
mariadb-install-db --user=mysql --ldata=/var/lib/mysql
#--ldata=/var/lib/mysql
mkdir /var/run/mysqld
chown -R mysql:root /var/run/mysqld
#mariadb --user=mysql < /usr/bin/setup.sql
#--init-file=/usr/bin/setup.sql
mysqld --user=mysql --init-file=/usr/bin/setup.sql