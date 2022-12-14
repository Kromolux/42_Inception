USE mysql;

CREATE USER IF NOT EXISTS 'WORDPRESS_DB_USER'@'%' IDENTIFIED BY 'WORDPRESS_DB_PASSWORD';
CREATE DATABASE IF NOT EXISTS WORDPRESS_DB_NAME;
GRANT ALL PRIVILEGES ON WORDPRESS_DB_NAME.* TO 'WORDPRESS_DB_USER'@'%';

FLUSH PRIVILEGES;

DELETE FROM mysql.user WHERE User='';

DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';

ALTER USER 'root'@'localhost' IDENTIFIED BY 'MYSQL_ROOT_PASSWORD';

FLUSH PRIVILEGES;