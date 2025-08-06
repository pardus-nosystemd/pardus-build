rm -f /var/lib/dpkg/info/systemd.p*
apt-get install elogind eudev sysvinit-core sysv-rc ntp wget -y --allow-remove-essential -y -o Dpkg::Options::="--force-confnew"
apt-get full-upgrade -y -o Dpkg::Options::="--force-confnew"
apt-get autoremove --purge -y
ln -s true /bin/systemctl # fake systemctl
