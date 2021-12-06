FROM nginx

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -qq install python3 python3-pip

COPY www /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf

