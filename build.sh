#!/bin/bash
set -ex
apt update
apt install xorriso grub-pc-bin grub-efi mtools make python3 libc6-dev \
    dosfstools e2fsprogs squashfs-tools python3-yaml ca-certificates \
    gcc wget curl unzip xz-utils zstd debootstrap git -y --no-install-recommends
ln -s sid /usr/share/debootstrap/scripts/yirmiuc-deb || true
cd ../
curdir=$PWD
for desktop in xfce gnome; do
    mkdir work/$desktop
    cd work/$desktop
    bash ../../mkiso.sh $desktop
    cd $curdir
done
