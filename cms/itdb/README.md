# Dockerfile for itdb

- itdb source: https://github.com/sivann/itdb
- Reference: http://www.sivann.gr/software/itdb/

## Build images
docker build -t itdb:1.23 .

## Start container
docker run --name itdb  -p 80:80 -d itdb:1.23

## docker-compose.yml example
```
  itdb:
    image: itdb:1.23
    container_name: itdb
    hostname: "itdb.mydomain.com"
    restart: always
    volumes:
      - ./itdb/apache.conf:/etc/apache2/sites-enabled/000-default.conf
      - /data/itdb/itdb.db:/var/www/itdb/data/itdb.db
```