FROM alpine:3.20
RUN apk add --no-cache bash \
    	    	       nginx
COPY tools/docker-entrypoint.sh /
RUN chmod 777 /docker-entrypoint.sh
EXPOSE 443
COPY tools/default.conf /etc/nginx/http.d/default.conf
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
