#!/usr/bin/env bash
cd /tmp
apt install wget pipewire -y
wget https://github.com/aleyna-tilki/pipewire-launcher/releases/download/current/pipewire-launcher_1.0.0_all.deb
apt install ./*.deb -yq --allow-downgrades

