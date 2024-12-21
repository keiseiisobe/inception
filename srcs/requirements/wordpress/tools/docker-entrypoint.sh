#! /bin/bash

if [ ! -s wp-config.php ]; then
   sed -i 's/database_name_here/$WORDPRESS_DB_NAME/g' wp-config-sample.php
   sed -i 's/username_here/$WORDPRESS_DB_USER/g' wp-config-sample.php
   sed -i 's/password_here/$WORDPRESS_DB_PASSWORD/g' wp-config-sample.php
   sed -i 's/localhost/$WORDPRESS_DB_HOST/g' wp-config-sample.php

   mv wp-config-sample.php wp-config.php
fi

exec "$@"
