#!/bin/bash

set -eo pipefail

if [[ "$(id -u)" -ne "0" ]]; then
    echo "This script requires root."
    exit 1
fi

BOARD=$1

rm -rf /etc/hosts /etc/hostname
touch /etc/hosts /etc/hostname


if [BOARD = 'radxa-zero'] then
cat <<-EOF > /etc/hostname
JeedomLuna
EOF
cat <<-EOF > /etc/hosts
127.0.0.1 localhost
127.0.1.1 jeedomluna
# The following lines are desirable for IPv6 capable hosts
#::1     localhost ip6-localhost ip6-loopback
#fe00::0 ip6-localnet
#ff00::0 ip6-mcastprefix
#ff02::1 ip6-allnodes
#ff02::2 ip6-allrouters
EOF
else
cat <<-EOF > /etc/hostname
JeedomAtlas
EOF
cat <<-EOF > /etc/hosts
127.0.0.1 localhost
127.0.1.1 jeedomatlas
# The following lines are desirable for IPv6 capable hosts
#::1     localhost ip6-localhost ip6-loopback
#fe00::0 ip6-localnet
#ff00::0 ip6-mcastprefix
#ff02::1 ip6-allnodes
#ff02::2 ip6-allrouters
EOF
fi
