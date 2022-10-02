apt update
apt install wget bzip2 zenity gvfs-fuse -y
apt full-upgrade -y
apt purge libreoffice-common -y
apt purge firefox-esr chromium -y
apt install librewolf -y
apt install mpv -y
apt purge audacious gdebi packagekit xterm xfce4-sensors-plugin vlc xarchiver gimp xsane evolution synaptic drawing catfish -y
apt autoremove --purge -y
