FROM debian:bullseye
RUN apt-get update; \
    apt-get install -y bash; \
    apt-get install -y lsb-release curl gpg; \
    curl -fsSL https://packages.redis.io/gpg | gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg; \
    chmod 644 /usr/share/keyrings/redis-archive-keyring.gpg; \
    echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/redis.list; \
    apt-get update; \
    apt-get install -y init systemd; \
    apt-get install -y redis
COPY tools/docker-entrypoint.sh /
RUN chmod 777 /docker-entrypoint.sh
EXPOSE 6379
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["redis-server"]
