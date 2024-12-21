FROM debian:bullseye
RUN apt-get update; \
    apt-get install -y bash \
    	    	       php-fpm \
		       php-mysql \
		       wget \
		       mariadb-client \
		       ;
RUN wget https://wordpress.org/latest.tar.gz; \
    tar -xzvf latest.tar.gz; \
    mv wordpress/* /var/www/html/; \
    rm -rf latest.tar.gz wordpress; \
    mkdir -p /var/www/html && \
    chown -R www-data:www-data /var/www/html
COPY tools/www.conf /etc/php/7.4/fpm/pool.d/
RUN mkdir /run/php
#COPY tools/www.conf /usr/local/etc/php-fpm.d/
COPY tools/docker-entrypoint.sh /
RUN chmod 777 /docker-entrypoint.sh
EXPOSE 9000
ENTRYPOINT ["/docker-entrypoint.sh"]
WORKDIR /var/www/html
CMD ["php-fpm7.4", "-F"]
#CMD ["bash"]