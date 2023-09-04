apt update
apt install wget bzip2 zenity gvfs-fuse -y -o Dpkg::Options::="--force-confnew" --allow-unauthenticated
apt full-upgrade -y -o Dpkg::Options::="--force-confnew" --allow-unauthenticated
apt purge libreoffice-common -y
apt purge firefox-esr -y
apt purge yelp gdebi packagekit xterm chromium vlc gimp xsane evolution synaptic drawing gnome-logs baobab gnome-contacts gnome-characters -y
apt autoremove --purge -y
