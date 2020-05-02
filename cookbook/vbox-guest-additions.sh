#!/usr/bin/env bash
export DEBIAN_FRONTEND=noninteractive

query-package () {
    dpkg-query -W -f='${Status}' $1 2>/dev/null | grep -c "ok installed"
}

if [ $(query-package virtualbox-guest-x11) -eq 1 ]; then
    echo "VirtualBox Guest Additions already installed"
else
    # sh -c \
    # "echo 'deb http://debian.inode.at/debian buster-backports main contrib non-free' > \
    # /etc/apt/sources.list.d/backports.list"
    apt-get update
    apt-get install linux-headers-$(uname -r) make gcc perl
    mkdir /mnt/vboxguest
    mount /home/vagrant/VBoxGuestAdditions.iso /mnt/vboxguest
    sh /mnt/vboxguest/VBoxLinuxAdditions.run
    # apt-get install -y virtualbox-guest-utils virtualbox-guest-x11 virtualbox-guest-dkms -t buster-backports
fi
