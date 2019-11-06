# itdb - a system to maintain data center configurations
# itdb source: https://github.com/sivann/itdb
# Dockerfile reference: https://github.com/Chris0408/ITDB-docker

# Unable to use 18.04 or 16.04 owing to lack of support to PHP5
FROM ubuntu:14.04

WORKDIR /scripts
COPY files/ /scripts/files/

RUN cp -f files/sources_ubuntu_14.list /etc/apt/sources.list \
    && apt-get update

RUN apt-get -y upgrade && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    apache2 libapache2-mod-php5 php5-sqlite sqlite3 \
    && apt-get -y install git

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

EXPOSE 80

ADD apache.conf /etc/apache2/sites-enabled/000-default.conf

RUN mkdir -p /var/www \
    && cd /var/www \
    && git clone https://github.com/sivann/itdb.git \
    && chmod 775 itdb  \
    && cd itdb \
    && cp data/pure.db data/itdb.db \
    && chown -R www-data:www-data data/ \
    && chown -R www-data:www-data translations/ \
    && chmod -R 775 data \
    && chmod -R 775 translations

# CMD /usr/sbin/apache2ctl -D FOREGROUND
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]