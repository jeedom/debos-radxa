#!/bin/bash

set -eo pipefail

if [[ "$(id -u)" -ne "0" ]]; then
     echo "This script requires root."
     exit 1
fi

# setup user
USER=jeedom
PASSWORDUSER=Mjeedom96

adduser --gecos "$USER" \
        --disabled-password \
        --shell /bin/bash \
        "$USER"

adduser "$USER" audio
adduser "$USER" sudo
adduser "$USER" video

echo "$USER:$PASSWORDUSER" | chpasswd
