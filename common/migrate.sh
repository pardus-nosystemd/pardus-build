cat > /etc/apt/sources.list.d/devuan.list << EOF
deb http://deb.devuan.org/merged testing main
EOF
rm -f /var/lib/dpkg/info/systemd.prerm
apt-mark hold desktop-base # Do not replace theme
apt-get update --allow-insecure-repositories
apt-get install devuan-keyring --allow-unauthenticated -y -o Dpkg::Options::="--force-confnew"
apt-get update
apt install elogind eudev sysvinit-core sysv-rc ntp -y --allow-remove-essential -y -o Dpkg::Options::="--force-confnew"
apt-get full-upgrade -y -o Dpkg::Options::="--force-confnew"
apt-get autoremove --purge -y
