# Docker Image for AWTRIX2

[
  ![](https://img.shields.io/docker/v/foorschtbar/awtrix2?style=plastic&sort=date)
  ![](https://img.shields.io/docker/pulls/foorschtbar/awtrix2?style=plastic)
  ![](https://img.shields.io/docker/stars/foorschtbar/awtrix2?style=plastic)
  ![](https://img.shields.io/docker/image-size/foorschtbar/awtrix2?style=plastic)
  ![](https://img.shields.io/github/workflow/status/foorschtbar/awtrix2-docker/CI%20Workflow?style=plastic)
](https://hub.docker.com/repository/docker/foorschtbar/awtrix2)
[
  ![](https://img.shields.io/github/last-commit/foorschtbar/awtrix2-docker?style=plastic)
](https://github.com/foorschtbar/awtrix2-docker)

Multi-Arch/Multi-Platform Docker Container for [AWTRIX2](https://blueforcer.de/2019/01/04/awtrix-2-0/). The Container downloads latest AWTRIX Host (Server) on start or restart, but you could disabled this. Default is the `stable` version, but you could also switch to the `beta` or `nightly` branch.

* GitHub: [foorschtbar/awtrix-docker](https://github.com/foorschtbar/awtrix-docker)
* Docker Hub: [foorschtbar/awtrix2](https://hub.docker.com/r/foorschtbar/awtrix2)

## Usage

Example docker-compose configuration:

```yml
version: "3"

services:
  awtrix:
    image: foorschtbar/awtrix2
    restart: unless-stopped
    ports:
      - "7000:7000"
      - "7001:7001"
      - "5568:5568"
    volumes:
      - ./data:/data
      - /sys/class/net/<your network interface>/address:/data/hostmac
    environment:
      - TZ=Europe/Berlin
      - JAVA_TOOL_OPTIONS="-Duser.language=de -Duser.country=DE"
```

### Persistent data
Add a volume or redirect to a folder on host.

```yml
    volumes:
        - ./data:/data
```

### Language

If you want AWTRIX to automatically display some apps like **DayOfTheWeek** in your local language/format (e.g. "Sonntag" instead of "Sunday") you can specify this with an eviroment variable.

```yml
    environment:
        - TZ=Europe/Berlin
        - JAVA_TOOL_OPTIONS="-Duser.language=de -Duser.country=DE"
```

* Where `de` is your two-letter language code. (see [ISO 639-2](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes))  
* And `DE` is your two-letter country code. (see [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2))

### Premium Users

AWTRIX Premium uses the MAC-Adress of the primary network interface for license binding. To avoid losing premium features (See [awtrixdocs.blueforder.de](https://awtrixdocs.blueforcer.de/#/de-de/premium?id=fehlerbehebung)), pass the host MAC to AWTRIX:

```yml
    volumes:
      - /sys/class/net/<eth0 or different network interface>/address:/data/hostmac
```

or run the container in host mode:

```yml
    #ports:
    # - "7000:7000"
    # - "7001:7001"
    # - "5568:5568"
    network_mode: host
```

### Autoupdate

To disable autoupdate on start/restart, set `AWTRIX_AUTOUPDATE` to `false`:

```yml
    environment:
      - AWTRIX_AUTOUPDATE=false
```

### Beta/Nightly versions

To use beta or nightly versions, set environment variable AWTRIX_UPDATE_CHANNEL to:

* `beta` or
* `nightly`

Example:
```yml
    environment:
      - AWTRIX_UPDATE_CHANNEL=beta
```

### Credits

The Container is based on the [wHyEt/Awtrix2-Docker](https://github.com/wHyEt/Awtrix2-Docker) image.