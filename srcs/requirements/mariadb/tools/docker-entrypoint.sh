#! /bin/bash

mariadbd&
sleep 5

mysql -u root -p$(< ${MYSQL_ROOT_PASSWORD_FILE}) -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost';"
mysql -u root -p$(< ${MYSQL_ROOT_PASSWORD_FILE}) -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql -u root -p$(< ${MYSQL_ROOT_PASSWORD_FILE}) -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '$(< ${MYSQL_PASSWORD_FILE})';"
mysql -u root -p$(< ${MYSQL_ROOT_PASSWORD_FILE}) -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
mysql -u root -p$(< ${MYSQL_ROOT_PASSWORD_FILE}) -e "FLUSH PRIVILEGES;"

/etc/init.d/mariadb stop

sed -i 's/bind-address/#bind-address/g' /etc/mysql/mariadb.conf.d/50-server.cnf 

exec "$@"
