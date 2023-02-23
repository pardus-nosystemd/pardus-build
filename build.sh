#!/bin/bash
set -ex
apt update
apt install xorriso grub-pc-bin grub-efi mtools make python3 \
    dosfstools e2fsprogs squashfs-tools python3-yaml \
    gcc wget curl unzip xz-utils zstd debootstrap git -y --no-install-recommends
git clone https://gitlab.com/tearch-linux/applications-and-tools/teaiso
cd teaiso
make && make install
ln -s sid /usr/share/debootstrap/scripts/yirmibir || true
cd ../
for desktop in xfce gnome kde cinnamon mate budgie ; do
    mkteaiso --profile=./pardus-$desktop --output=/output/ --debug 2>&1 &
done
wait
