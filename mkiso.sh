#!/bin/bash
set -e
#### Check root
if [[ ! $UID -eq 0 ]] ; then
    echo -e "\033[31;1mYou must be root!\033[:0m"
    exit 1
fi
#### Remove all environmental variable
for e in $(env | sed "s/=.*//g") ; do
    unset "$e" &>/dev/null
done

#### Set environmental variables
export PATH=/bin:/usr/bin:/sbin:/usr/sbin
export LANG=C
export SHELL=/bin/bash
export TERM=linux
export DEBIAN_FRONTEND=noninteractive

variant="$1"

set -ex
mkdir iso || true

#### For devuan
debootstrap --variant=minbase --no-check-gpg --arch=amd64 stable chroot https://deb.debian.org/debian
echo "deb https://deb.debian.org/debian stable main contrib non-free non-free-firmware" > chroot/etc/apt/sources.list

#### Set root password
pass="live"
echo -e "$pass\n$pass\n" | chroot chroot passwd

#### Fix apt & bind
# apt sandbox user root
echo "APT::Sandbox::User root;" > chroot/etc/apt/apt.conf.d/99sandboxroot
for i in dev dev/pts proc sys; do mount -o bind /$i chroot/$i; done
chroot chroot apt-get install gnupg -y

##### Devuan only
chroot chroot apt-get install devuan-keyring -y

#### live packages for debian/devuan
chroot chroot apt-get install live-config live-boot -y
echo "DISABLE_DM_VERITY=true" >> chroot/etc/live/boot.conf

#### Configure system
cat > chroot/etc/apt/apt.conf.d/01norecommend << EOF
APT::Install-Recommends "0";
APT::Install-Suggests "0";
EOF

#### variant scripts
for script in $(ls ../../common) ; do
    cat ../../common/$script | chroot chroot bash -ex
done

for script in $(ls ../../$variant) ; do
    cat ../../$variant/$script  | chroot chroot bash -ex
done


#### Clear logs and history
chroot chroot apt-get clean
rm -f chroot/root/.bash_history
rm -rf chroot/var/lib/apt/lists/*
find chroot/var/log/ -type f | xargs rm -f

### create iso template
mkdir -p debjaro/boot || true
mkdir -p debjaro/live || true
ln -s live debjaro/casper || true

#### Copy kernel and initramfs (Debian/Devuan)
cp -pf chroot/boot/initrd.img-* debjaro/boot/initrd.img
cp -pf chroot/boot/vmlinuz-* debjaro/boot/vmlinuz

#### Remove initrd.img for minimize iso size (optional)
rm -rf chroot/boot/initrd.img-*

#### Create squashfs
for dir in dev dev/pts proc sys ; do
    while umount -lf -R chroot/$dir 2>/dev/null ; do true; done
done

mksquashfs chroot filesystem.squashfs -comp xz -wildcards

### move squashfs file
mv filesystem.squashfs iso/live/filesystem.squashfs

#### Write grub.cfg
mkdir -p iso/boot/grub/
echo 'menuentry "Start Pardus GNU/Linux 64-bit" --class pardus {' > iso/boot/grub/grub.cfg
echo '    linux /boot/vmlinuz boot=live live-config quiet --' >> iso/boot/grub/grub.cfg
echo '    initrd /boot/initrd.img' >> iso/boot/grub/grub.cfg
echo '}' >> iso/boot/grub/grub.cfg

#### Create iso
grub-mkrescue chroot -o pardus-$variant.iso
