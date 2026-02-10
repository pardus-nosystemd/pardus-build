
cat > /etc/apt/sources.list << EOF
deb http://deb.devuan.org/merged stable main contrib non-free non-free-firmware
EOF

rm -f /var/lib/dpkg/info/systemd.p*
apt-get update --allow-insecure-repositories
apt-get install devuan-keyring -y --allow-unauthenticated
apt-get update
apt install elogind sysvinit-core openrc systemd- systemd-sysv- -y --allow-remove-essential
apt-mark hold systemd libsystemd0 libsystemd-shared
apt-get full-upgrade -y -o Dpkg::Options::="--force-confnew"
apt-get autoremove --purge -y
ln -s true /bin/systemctl || true
