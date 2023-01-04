cat > /etc/apt/sources.list << EOF
deb http://deb.devuan.org/merged testing main contrib non-free
deb http://deb.debian.org/debian testing main contrib non-free
EOF
rm -f /var/lib/dpkg/info/systemd.prerm
apt-get update --allow-insecure-repositories
apt-get install devuan-keyring --allow-unauthenticated -y -o Dpkg::Options::="--force-confnew"
apt-get update
ln -s true /bin/systemctl # fake systemctl
apt-get install elogind eudev sysvinit-core sysv-rc ntp wget -y --allow-remove-essential -y -o Dpkg::Options::="--force-confnew"
apt-get full-upgrade -y -o Dpkg::Options::="--force-confnew"
apt-get autoremove --purge -y
cd /tmp
wget https://github.com/my-garbage-stuff/systemd-dummy/releases/download/current/systemd_9999-noupdate_all.deb
dpkg -i tmp/*.deb
