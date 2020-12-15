#FROM anapsix/alpine-java:8_jdk
#FROM armv7/armhf-java8
#FROM arm64v8/openjdk
ARG arch=armv7/armhf-java8
FROM ${arch}

WORKDIR /data
EXPOSE 7000 7001

COPY ./assets/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]