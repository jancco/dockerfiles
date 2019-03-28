# privoxy Image

### Launch the service in server side

You can directly launch the container by docker run:

```
docker run -d \
	--restart always \
	# the link inside the container must be named "torproxy"
	# see: https://github.com/jessfraz/dockerfiles/blob/master/privoxy/privoxy.conf#L1317
	--link torproxy:torproxy \
	-v /etc/localtime:/etc/localtime:ro \
	-p 8118:8118 \
	--name privoxy \
	jess/privoxy
```

Or you can use docker-compose to launch it:

```
version: '2'
services:
  privoxy:
    container_name: privoxy
    image: jess/privoxy
    volumes:
      - /etc/localtime:/etc/localtime:ro
    ports:
      - 8118:8118
    links:
      - torproxy:torproxy
    restart: always
```

### Configurate in client side

1.Add proxy environment variables 

Open /etc/profile
```
sudo vim /etc/profile
```

And add the following lines to the end:
```
export http_proxy=http://<proxy_server_ip>:8118
export https_proxy=https://<proxy_server_ip>:8118
```

After saving, source the file to bring the variables into effect:
```
source /etc/profile
``` 
