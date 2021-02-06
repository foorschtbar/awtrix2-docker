FROM ubuntu:focal

# Install openjdk8
RUN set -eux; \
    apt-get update ; \
    apt-get upgrade -y ; \
    apt-get install -y \
    wget \
    openjdk-8-jre \
    openjdk-8-jdk

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
