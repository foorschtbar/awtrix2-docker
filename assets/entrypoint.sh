#!/bin/sh

set -e
TARGET_FILE=/data/awtrix.jar
AWTRIX_UPDATE_CHANNEL=${AWTRIX_UPDATE_CHANNEL:-stable}
AWTRIX_DL_URL=https://blueforcer.de/awtrix/$AWTRIX_UPDATE_CHANNEL/awtrix.jar
AWTRIX_AUTOUPDATE=${AWTRIX_AUTOUPDATE:-true}
AWTRIX_LOGGER=${AWTRIX_LOGGER:-stdout}

echo "Welcome to awtrix2-docker!"
echo "Release Channel for AWTRIX Host is '$AWTRIX_UPDATE_CHANNEL'"
if [ "$AWTRIX_AUTOUPDATE" = true ] || [ ! -f "$TARGET_FILE" ]; then
    echo "Download Host JAR from $AWTRIX_DL_URL"
    echo "Please wait..."
    if wget $AWTRIX_DL_URL -q -O $TARGET_FILE  ; then
        echo "Download finished!"
        
    else 
        echo "Download failed!"
        exit 1
    fi
else
     echo "Skip Download"
fi

echo "Start AWTRIX Host..."
java -jar $TARGET_FILE --logger=$AWTRIX_LOGGER