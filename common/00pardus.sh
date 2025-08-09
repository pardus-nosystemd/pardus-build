cat > /etc/apt/sources.list.d/pardus.list << EOF
deb http://depo.pardus.org.tr/pardus yirmiuc main contrib non-free
deb http://depo.pardus.org.tr/pardus yirmiuc-deb main contrib non-free
deb http://depo.pardus.org.tr/guvenlik yirmiuc-deb main contrib non-free
EOF
apt-get update --allow-insecure-repositories
apt-get install pardus-archive-keyring --allow-unauthenticated -y -o Dpkg::Options::="--force-confnew"
apt-get update
apt-get full-upgrade -yq
# install pardus software
apt-get -yq install pardus-software pardus-update pardus-menus
