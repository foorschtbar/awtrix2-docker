FROM alpine:3

# Install openjdk8
RUN set -eux; \
    apk add --no-cache openjdk8-jre

# Add non-root user and run container as non-root
RUN adduser -D -H -u 1000 -s /usr/bin/bash awtrix

# Set workdir and ports
WORKDIR /data
EXPOSE 7000 7001

# Set entrypoint
COPY ./assets/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# switch user and set entrypoint 
USER awtrix
ENTRYPOINT [ "/entrypoint.sh" ]
