#!/bin/bash

set -eo pipefail

if [[ "$(id -u)" -ne "0" ]]; then
     echo "This script requires root."
     exit 1
fi

# setup user
USER="jeedom"

adduser --gecos "$USER" \
        --disabled-password \
        --shell /bin/bash \
        "Mjeedom96"

adduser "$USER" audio
adduser "$USER" sudo
adduser "$USER" video
#adduser "$USER" render

echo "$USER:$USER" | chpasswd
