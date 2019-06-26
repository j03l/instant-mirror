FROM ubuntu:18.04

# Update ubuntu
RUN apt-get update
RUN apt-get dist-upgrade -y

# get needed packages
RUN apt-get install -y nginx wget

COPY default.conf /etc/nginx/conf.d/default.conf

ADD substitute.sh /substitute.sh
ADD wget.sh /wget.sh
ADD start.sh /start.sh


RUN chmod 700 /substitute.sh
RUN chmod 700 /wget.sh
RUN chmod 700 /start.sh

EXPOSE 80

CMD ["./substitute.sh"]
CMD ["./wget.sh"]
CMD ["./start.sh"]