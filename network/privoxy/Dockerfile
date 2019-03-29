# run a privoxy in a container and link to a tor socks proxy container

FROM ubuntu:16.04

RUN apt-get update && apt-get install privoxy -y && \
    sed -i '/^listen-address/'d /etc/privoxy/config && \
    echo "listen-address  0.0.0.0:8118" >> /etc/privoxy/config

ENTRYPOINT ["privoxy", "--no-daemon", "--user", "privoxy", "/etc/privoxy/config"]
