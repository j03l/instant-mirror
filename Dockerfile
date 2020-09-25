FROM docker.io/alpine
MAINTAINER Joel Davies joel@jdav.studio
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

#cron job for wget
COPY wget-cron /etc/cron.d/wget-cron
RUN chmod 0644 /etc/cron.d/wget-cron
RUN crontab /etc/cron.d/wget-cron
RUN touch /var/log/cron.log

CMD cron && tail -f /var/log/cron.log

ENTRYPOINT ["/usr/local/bin/run"]