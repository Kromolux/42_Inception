
mv /var/www/wordpress/* /var/www/html/


chown -R nginx:nginx /var/www/html

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

sed -i "s/database_name_here/$WORDPRESS_DB_NAME/g" /var/www/html/wp-config.php
sed -i "s/username_here/$WORDPRESS_DB_USER/g" /var/www/html/wp-config.php
sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/g" /var/www/html/wp-config.php
sed -i "s/localhost/$WORDPRESS_DB_HOST/g" /var/www/html/wp-config.php

exec /usr/sbin/php-fpm7 -F