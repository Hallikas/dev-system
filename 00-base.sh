#!/bin/bash

# Create SWAP file for system
[ -e /.swap ] || ( dd if=/dev/zero of=/.swap bs=1K count=4M ; chmod 600 /.swap ; mkswap /.swap ; echo "/.swap swap swap defaults 0 0" >> /etc/fstab )
swapon -a

apt-get update
dpkg-reconfigure tzdata
apt-get -y upgrade

apt-get install -y \
        lsb-release joe apache2-utils jq snapd ca-certificates curl # mariadb-client-core-10.3


# Create few directories for kubernetes, that we will use later
# If you are planning to use HA-kubernetes, you probably would
# like to reconsider how you share your storage. Now we just do
# it quick and really dirty as local host storage.
mkdir -p /data/{patch/{etc,lib},kube}

# Move SSH from port 22 to another, so gitlab can use SSH port
# Note! You must remember this new port and use it, when connecting
# to host system
perl -pi -e 's|#Port 22|Port 6022|' /etc/ssh/sshd_config
service sshd restart
