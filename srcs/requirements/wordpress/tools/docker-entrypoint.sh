#! /bin/bash

sleep 10

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
       --admin_password=$(< ${WORDPRESS_ADMIN_PASSWORD_FILE})  \
       --admin_email=${WORDPRESS_ADMIN_EMAIL}
    wp --allow-root user create \
	${WORDPRESS_USER_LOGIN} \
	${WORDPRESS_USER_EMAIL} \
	--user_pass=$(< ${WORDPRESS_USER_PASSWORD_FILE})

    # redis
    wp --allow-root plugin install redis-cache --activate
    wp --allow-root redis enable
fi

exec "$@"
