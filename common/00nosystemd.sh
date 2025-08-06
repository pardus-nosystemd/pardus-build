
cat > /etc/apt/sources.list << EOF
deb http://deb.devuan.org/merged stable main contrib non-free non-free-firmware
deb http://deb.devuan.org/merged stable-backports main contrib non-free non-free-firmware
EOF
cat > /etc/apt/preferences.d/devuan-backports_default << EOF
Package: *
Pin: release n=stable-backports
Pin-Priority: 500
EOF
rm -f /var/lib/dpkg/info/systemd.p*
apt-get update --allow-insecure-repositories
apt-get install devuan-keyring -y --allow-unauthenticated
apt-get update
apt-get purge systemd-timesyncd systemd -yq || true
apt-get install devuan-keyring elogind libpam-elogind eudev sysvinit-core sysv-rc ntp wget -y --allow-remove-essential -y -o Dpkg::Options::="--force-confnew"
apt-get full-upgrade -y -o Dpkg::Options::="--force-confnew"
apt-get autoremove --purge -y
apt-mark hold systemd libsystemd0
ln -s true /bin/systemctl || true
