#! /bin/bash

if [ ! -s wp-config.php ]; then
    wp --allow-root core download
    wp --allow-root config create \
       --dbname=${WORDPRESS_DB_NAME} \
       --dbuser=${WORDPRESS_DB_USER} \
       --dbpass=$(< ${WORDPRESS_DB_PASSWORD_FILE}) \
       --dbhost=${WORDPRESS_DB_HOST}
    wp --allow-root core install \
       --url=${WORDPRESS_URL} \
       --title=${WORDPRESS_TITLE} \
       --admin_user=${WORDPRESS_ADMIN_USER} \
       --admin_email=${WORDPRESS_ADMIN_EMAIL}
    wp --allow-root user create ${WORDPRESS_USER_LOGIN} ${WORDPRESS_USER_EMAIL}
fi

echo "hello world" > index.html

exec "$@"
