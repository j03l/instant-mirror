#!/bin/sh
ALLOW=${ALLOW:-192.168.0.0/16 172.16.0.0/12}
OWNER=${OWNER:-nobody}
GROUP=${GROUP:-nogroup}

chown "${OWNER}:${GROUP}" "/var/www/html"

[ -f /etc/nginx/conf.d/default.conf ] || cat <<EOF > /etc/nginx/conf.d/default.conf
server {
  listen 80 default_server;
  listen [::]:80 default_server;
  
  # Everything is a 404
  root /var/www/html;
  
  $(for a in ${ALLOW}; do echo "allow ${a};"; done)
  deny all;
  
  autoindex on;
  access_log /dev/stderr;
  error_log /dev/stdout;
}
EOF

#change directories for the mirror
cd /var/www/html

# do the mirror in the background
wget -o wget-log -mkEpnp -nH "http://packages.instantos.io/" &

# start nginx
nginx -g 'daemon off; pid /run/nginx.pid;' &

trap "killall nginx" QUIT TERM

wait
