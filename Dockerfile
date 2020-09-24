FROM alpine
LABEL maintainer="Joel Davies joel@jdav.studio"

RUN apk add --no-cache --update \
	nginx \
	wget \
  && rm -f \
    /etc/nginx/conf.d/default.conf

EXPOSE 80

ADD ./run /usr/local/bin/run
RUN chmod 700 /usr/local/bin/run

ENTRYPOINT ["/usr/local/bin/run"]