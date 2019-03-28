# tor-proxy Image

### Launch the service in server side

You can directly launch the container by docker run:

```
docker run -d \
	--restart always \
	-v /etc/localtime:/etc/localtime:ro \
	-p 9050:9050 \
 	--name torproxy \
 	jess/tor-proxy
```

Or you can use docker-compose to launch it:

```
version: '2'
services:
  torproxy:
    container_name: torproxy
    image: jess/tor-proxy
    volumes:
      - /etc/localtime:/etc/localtime:ro
    ports:
      - 9050:9050
    restart: always
```
