# TODO
# FROM nginx
FROM nginx
COPY ./public/ /usr/share/nginx/html/

## add permissions
RUN useradd -u 1000 app \
  && mkdir -p /var/run/nginx /var/tmp/nginx \
  && chown -R 1000:1000 /usr/share/nginx /var/run/nginx /var/tmp/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/default.conf /etc/nginx/conf.d/

USER 1000:1000
