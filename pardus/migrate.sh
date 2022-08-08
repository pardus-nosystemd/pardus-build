cat > /etc/apt/sources.list.d/devuan.list << EOF
deb http://deb.devuan.org/merged stable main
deb http://deb.devuan.org/merged stable-updates main
deb http://deb.devuan.org/merged stable-security main
#deb http://deb.devuan.org/merged stable-backports main
EOF
rm -f /var/lib/dpkg/info/systemd.prerm
apt-get update --allow-insecure-repositories
apt-get install devuan-keyring --allow-unauthenticated -y
apt-get update
apt install elogind eudev sysvinit-core sysv-rc -y --allow-remove-essential -y
apt-get full-upgrade -y
apt-get autoremove --purge -y
