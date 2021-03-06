#!/bin/bash
CONTAINER_ID=$(docker run --name pptpd -d -t --privileged --restart=always -p 1723:1723 zealic/pptpd)
if [ $? -ne 0 ]; then
  echo Run container failed, permission is required?
  exit 1
fi

CONTAINER_IP=$(docker inspect -f "{{ .NetworkSettings.IPAddress }}" $CONTAINER_ID)
iptables -t nat -C DOCKER -p gre -j DNAT --to-destination $CONTAINER_IP 2>/dev/null
if [ $? -ne 0 ]; then
  iptables -t nat -A DOCKER -p gre -j DNAT --to-destination $CONTAINER_IP
  echo GRE rule added.
fi

echo PPTPd container started.
