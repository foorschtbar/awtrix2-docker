FROM ubuntu:focal

# Install openjdk8
RUN set -eux; \
    apt-get update ; \
    apt-get upgrade -y ; \
    apt-get install -y \
    wget \
    openjdk-8-jre \
    openjdk-8-jdk

# Fix strange certificat issue https://askubuntu.com/a/1303057/1179649
RUN set -eux; \
    apt-get install --reinstall ca-certificates; \
    apt-get -f -y install; \
    dpkg --purge --force-depends ca-certificates; \
    apt-get -f -y install

# Add non-root user and run container as non-root
RUN useradd -M -u 1000 -s /usr/bin/bash awtrix

# Set workdir and ports
WORKDIR /data
EXPOSE 7000 7001

# Set entrypoint
COPY ./assets/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# switch user and set entrypoint 
USER awtrix
ENTRYPOINT [ "/entrypoint.sh" ]
