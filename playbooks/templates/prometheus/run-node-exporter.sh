docker rm -f node-exporter || /bin/true || /usr/bin/true

docker run -d -p 9100:9100 \
  --restart=unless-stopped \
  --name node-exporter \
  -v "/proc:/host/proc:ro" \
  -v "/sys:/host/sys:ro" \
  -v "/:/rootfs:ro,rslave" \
  --net="host" \
  quay.io/prometheus/node-exporter \
    --path.procfs /host/proc \
    --path.sysfs /host/sys \
    --collector.filesystem.ignored-mount-points "^/(sys|proc|dev|host|etc)($|/)"