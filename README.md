# rtorrent-exporter
A Dockerfile for rtorrent_exporter 

## An example of docker-composer.yml
```
rtorrent-exporter:
    container_name: rtorrent-exporter
    image: hhhzzzhou/rtorrent-exporter
    restart: unless-stopped
    command: "-rtorrent.addr http://RTORRENT_SERVER_IP/RPC2"
    ports:
      - 9135:9135
```
