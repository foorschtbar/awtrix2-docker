# Docker Image for AWTRIX #

[
  ![](https://img.shields.io/docker/v/foorschtbar/awtrix-docker?style=plastic)
  ![](https://img.shields.io/docker/pulls/foorschtbar/awtrix-docker?style=plastic)
  ![](https://img.shields.io/docker/stars/foorschtbar/awtrix-docker?style=plastic)
  ![](https://img.shields.io/docker/image-size/foorschtbar/awtrix-docker?style=plastic)
  ![](https://img.shields.io/docker/cloud/build/foorschtbar/awtrix-docker?style=plastic)
](https://hub.docker.com/repository/docker/foorschtbar/awtrix-docker)
[
  ![](https://img.shields.io/github/last-commit/foorschtbar/awtrix-docker?style=plastic)
](https://github.com/foorschtbar/awtrix-docker)

Multi-Arch/Multi-Platform Docker Container for [Awtrix2](https://blueforcer.de/2019/01/04/awtrix-2-0/).

The Container is based on the [wHyEt/Awtrix2-Docker](https://github.com/wHyEt/Awtrix2-Docker) image.

It has an autoupdate feature witch will get the latest Host from the Awtrix Site on a restart from the Container.

* GitHub: [foorschtbar/awtrix-docker](https://github.com/foorschtbar/awtrix-docker)
* Docker Hub: [foorschtbar/awtrix-docker](https://hub.docker.com/r/foorschtbar/awtrix-docker)

## Usage ##

Example docker-compose configuration:

```yml
version: "3"

services:
  awtrix:
    image: foorschtbar/awtrix-docker
    container_name: <changeme>-web
    hostname: <changeme>
    restart: unless-stopped
    ports:
      - "7000:7000"
      - "7001:7001"
    #network_mode: host
    volumes:
      - ./data:/data
    environment:
      - TZ=Europe/Berlin
      - JAVA_TOOL_OPTIONS="-Duser.language=de -Duser.country=DE"
      - AWTRIX_BETA=false
```

# For persistent Data add:

```yml
    volumes:
        - ./data:/data
```

# Set Language

If you want AWTRIX to automatically display some apps like **DayOfTheWeek** in your local language/format (e.g. "Sonntag" instead of "Sunday") you can specify this with an eviroment variable.

```yml
    environment:
        - TZ=Europe/Berlin
        - JAVA_TOOL_OPTIONS="-Duser.language=de -Duser.country=DE"
```


Where `de` is your two-letter language code. (see [ISO 639-2](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes))  
And `DE` is your two-letter country code. (see [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2))

# IMPORTANT for Awtrix Premium Users

If you have Awtrix Premium run the Docker Container in Host-Mode, since a rebuild of the Container is triggering a change in the hardware ID. See (https://awtrixdocs.blueforcer.de/#/de-de/premium?id=fehlerbehebung)

```yml
    #ports:
    # - "7000:7000"
    # - "7001:7001"
    network_mode: host
```

# Beta versions

To use beta version, set environment variable AWTRIX_BETA to true

```yml
    environment:
        AWTRIX_BETA=true
```