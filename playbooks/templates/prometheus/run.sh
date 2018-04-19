#!/bin/sh

docker rm -f prometheus || /bin/true || /usr/bin/true

docker run --detach -p 9090:9090 \
--restart unless-stopped \
--name prometheus \
-v /srv/prometheus/etc/:/etc/prometheus/ \
-v /srv/prometheus/data:/prometheus \
prom/prometheus