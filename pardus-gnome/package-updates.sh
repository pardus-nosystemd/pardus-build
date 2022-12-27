apt update
apt install wget bzip2 zenity gvfs-fuse -y -o Dpkg::Options::="--force-confnew"
apt full-upgrade -y -o Dpkg::Options::="--force-confnew"
apt purge libreoffice-common -y
apt purge firefox-esr -y
apt install librewolf -y -o Dpkg::Options::="--force-confnew"
apt purge yelp gdebi packagekit xterm chromium vlc gimp xsane evolution synaptic drawing gnome-logs baobab gnome-contacts gnome-characters -y
apt autoremove --purge -y
