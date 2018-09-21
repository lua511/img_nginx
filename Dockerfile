FROM ubuntu:14.04

VOLUME /wwwroot
VOLUME /wwwconfig
VOLUME /var/log/nginx

ARG DEBIAN_FRONTEND=noninteractive
RUN sed -i "s/^exit 101$/exit 0/" /usr/sbin/policy-rc.d \
    && apt-get update \
    && apt-get install -y nginx \
    && rm -rf /etc/nginx/sites-available && ln -s /wwwconfig /etc/nginx/sites-available \
    && rm -rf /etc/nginx/sites-enabled && ln -s /wwwconfig /etc/nginx/sites-enabled

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
