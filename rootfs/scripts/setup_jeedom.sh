#!/bin/bash

set -eo pipefail

if [[ "$(id -u)" -ne "0" ]]; then
    echo "This script requires root."
    exit 1
fi

BOARD=$1

localedef -i fr_FR -c -f UTF-8 -A /usr/share/locale/locale.alias fr_FR.UTF-8
cd /tmp
echo "Telecharegment de Jeedom. puis chmod +x"
wget https://raw.githubusercontent.com/jeedom/core/master/install/install.sh
chmod +x install.sh
echo "Installation de Jeedom lancer."
bash install.sh
