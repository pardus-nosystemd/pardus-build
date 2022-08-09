# Pardus build
**Unofficial** Clone of pardus xfce iso. This project **is not official** build.

This build is experimental so may not working good...

## Build:
Run this as command root:
`mkteaiso --profile=./pardus --output=./output --debug`

## Dependencies
* teaiso (https://gitlab.com/tearch-linux/applications-and-tools/teaiso)

## Issues
* Debian-installer missing (teaiso not support)

## Extras
* libreoffice removed
* java removed.
* linux kernel replaced with https://liquorix.net/
* firefox-esr replaced with librewolf
* systemd removed (replaced with sysv-init from devuan repository)
* backports repository added. 
