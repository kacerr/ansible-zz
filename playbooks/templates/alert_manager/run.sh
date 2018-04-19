#!/bin/sh

docker rm -f alertmanager || /bin/true

docker run -d --name alertmanager \
--restart unless-stopped \
       -p 9093:9093 \
       -v /srv/alertmanager/alertmanager.yml:/etc/alertmanager/alertmanager.conf \
       -v /srv/alertmanager/tmp/prom:/tmp/prom \
       prom/alertmanager -config.file=/etc/alertmanager/alertmanager.conf

