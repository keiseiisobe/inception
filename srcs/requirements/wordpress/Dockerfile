FROM debian:bullseye
RUN apt-get update; \
    apt-get install -y bash \
    	    	       php-fpm \
		       php-mysql \
		       curl \
		       mariadb-client \
		       redis \
		       ;
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp; \
    mkdir -p /var/www/html && \
    chown -R www-data:www-data /var/www/html && \
    chmod -R +x /var/www/html;
COPY tools/www.conf /etc/php/7.4/fpm/pool.d/
COPY tools/42tokyo.html /var/www/html/
RUN mkdir /run/php
COPY tools/docker-entrypoint.sh /
RUN chmod 777 /docker-entrypoint.sh
EXPOSE 9000
ENTRYPOINT ["/docker-entrypoint.sh"]
WORKDIR /var/www/html
CMD ["php-fpm7.4", "-F"]
