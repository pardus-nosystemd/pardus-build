
cat > /etc/apt/sources.list << EOF
deb http://deb.devuan.org/merged stable main contrib non-free non-free-firmware
deb http://deb.devuan.org/merged stable-security main contrib non-free non-free-firmware
deb http://deb.devuan.org/merged stable-updates main contrib non-free non-free-firmware
EOF

rm -f /var/lib/dpkg/info/systemd.p*
apt-get update --allow-insecure-repositories
apt-get install devuan-keyring -y --allow-unauthenticated
apt-get update
apt install elogind libpam-elogind sysvinit-core sysv-rc systemd- systemd-sysv- -y --allow-remove-essential
apt-mark hold systemd || true
apt-mark hold libsystemd0 || true
apt-mark hold libsystemd-shared || true
apt-get full-upgrade -y -o Dpkg::Options::="--force-confnew"
apt-get autoremove --purge -y
ln -s true /bin/systemctl || true
