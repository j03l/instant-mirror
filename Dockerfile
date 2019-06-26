FROM ubuntu:18.04

# Update ubuntu
RUN apt-get update
RUN apt-get dist-upgrade -y

# get needed packages
RUN apt-get install -y nginx wget

COPY default.conf /etc/nginx/conf.d/default.conf

ADD start.sh /start.sh

RUN chmod 700 /start.sh

EXPOSE 80

CMD ["./start.sh"]