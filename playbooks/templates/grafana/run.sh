#!/bin/sh

docker rm -f grafana || /bin/true

docker run -d --name grafana \
--restart unless-stopped \
  -p 3000:3000 \
  -v /srv/grafana/data:/var/lib/grafana \
  -e "GF_SECURITY_ADMIN_PASSWORD=secret" \
  grafana/grafana:latest