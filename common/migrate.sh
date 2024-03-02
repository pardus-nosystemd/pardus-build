cat > /etc/apt/sources.list << EOF
deb http://deb.devuan.org/merged testing main contrib non-free non-free-firmware
deb http://deb.debian.org/debian testing main contrib non-free non-free-firmware
EOF
rm -f /var/lib/dpkg/info/systemd.prerm
apt-get update --allow-insecure-repositories
apt-get install devuan-keyring wget --allow-unauthenticated -y -o Dpkg::Options::="--force-confnew"
apt-get update
cd /tmp
wget https://github.com/my-garbage-stuff/systemd-dummy/releases/download/current/systemd_9999-noupdate_all.deb
wget https://github.com/pardus-nosystemd/desktop-base/releases/download/current/desktop-base_9999-noupdate_all.deb
wget https://github.com/pardus-nosystemd/base-files/releases/download/current/base-files_9999-noupdate_amd64.deb
apt install ./*.deb -yq --allow-downgrades
apt-mark hold desktop-base # do not update desktop-base
ln -s true /bin/systemctl # fake systemctl
apt-get install elogind eudev sysvinit-core sysv-rc ntp wget -y --allow-remove-essential -y -o Dpkg::Options::="--force-confnew"
apt-get full-upgrade -y -o Dpkg::Options::="--force-confnew"
apt-get autoremove --purge -y

#### non-usrmerge broken for debian 
apt install usrmerge --reinstall -yq
