cat > /etc/apt/sources.list << EOF
deb http://deb.devuan.org/merged testing main contrib non-free
EOF
rm -f /var/lib/dpkg/info/systemd.prerm
apt-get update --allow-insecure-repositories
apt-get install devuan-keyring wget --allow-unauthenticated -y -o Dpkg::Options::="--force-confnew"
apt-get update
cd /tmp
wget https://github.com/my-garbage-stuff/systemd-dummy/releases/download/current/systemd_9999-noupdate_all.deb
wget https://github.com/debjaro/repo/blob/master/stable/pool/main/desktop-base_9999-noupdate_all.deb
wget https://github.com/pardus-nosystemd/base-files-pardus/releases/download/current/base-files_9999-noupdate_amd64.deb
dpkg -i /tmp/*.deb
ln -s true /bin/systemctl # fake systemctl
apt-get install elogind eudev sysvinit-core sysv-rc ntp wget -y --allow-remove-essential -y -o Dpkg::Options::="--force-confnew"
apt-get full-upgrade -y -o Dpkg::Options::="--force-confnew"
apt-get autoremove --purge -y
