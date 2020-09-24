FROM alpine
LABEL maintainer="Joel Davies joel@jdav.studio"
LABEL version="1.0"
LABEL description="This container is designed to provide quick and 'instant' way to create your own InstantOS mirror. \
Simply run this with Docker / Podman and go to port 8080 in your web browser."

RUN apk add --no-cache --update \
	nginx \
	wget \
  && rm -f \
    /etc/nginx/conf.d/default.conf

EXPOSE 80
VOLUME /mirror
ADD ./run /usr/local/bin/run
RUN chmod 700 /usr/local/bin/run

ENTRYPOINT ["/usr/local/bin/run"]