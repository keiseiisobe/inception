#! /bin/bash

mysqld --skip-grant-tables&

mysql -u root -p password -e "CREATE DATABASE ${MYSQL_DATABASE};"
mysql -u root -p password -e "CREATE USER ${MYSQL_USER}@mariadb IDENTIFIED BY ${MYSQL_PASSWORD};"
mysql -u root -p password -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO ${MYSQL_USER}@mariadb;"
mysql -u root -p password -e "FLUSH PRIVILEGES;"

exec "$@"
