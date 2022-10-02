apt update
apt install wget bzip2 zenity gvfs-fuse -y
apt full-upgrade -y
apt purge libreoffice-common -y
apt purge firefox-esr gnome-core -y
apt install librewolf -y
apt install mpv -y
apt purge gdebi packagekit xterm yelp vlc gimp xsane evolution synaptic drawing baobab brasero -y
apt autoremove --purge -y
