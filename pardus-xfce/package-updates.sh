apt update
apt install wget bzip2 zenity gvfs-fuse -y -o Dpkg::Options::="--force-confnew" --allow-unauthenticated
apt full-upgrade -y -o Dpkg::Options::="--force-confnew" --allow-unauthenticated
apt purge libreoffice-common -y
apt purge firefox-esr -y
apt install librewolf -y -o Dpkg::Options::="--force-confnew" --allow-unauthenticated
apt purge audacious gdebi packagekit xterm xfce4-sensors-plugin vlc xarchiver gimp xsane evolution synaptic drawing catfish -y
apt autoremove --purge -y
