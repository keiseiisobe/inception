FROM debian:bullseye
RUN apt-get update; \
    apt-get install -y bash \
    	    	       mariadb-server
COPY tools/docker-entrypoint.sh /
RUN chmod 777 /docker-entrypoint.sh
RUN mkdir -p /var/lib/mysql /run/mysqld; \
    chown -R mysql:mysql /var/lib/mysql /run/mysqld
EXPOSE 3306
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["mariadbd"]
