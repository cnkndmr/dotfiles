#!/bin/sh

timedatectl set-ntp true
mkfs.ext4 /dev/sda1
mkswap /dev/sda2
swapon /dev/sda2
mount /dev/sda1 /mnt
curl -Ss "https://www.archlinux.org/mirrorlist/?country=DE&protocol=http&protocol=https&ip_version=4" | sed 's/^#//' > /etc/pacman.d/mirrorlist
pacstrap /mnt base linux linux-firmware nano networkmanager grub
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt << EOF
ln -sf /usr/share/zoneinfo/Europe/Istanbul /etc/localtime
hwclock –systohc
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "core" > /etc/hostname
echo "127.0.0.1 localhost
::1 localhost
127.0.1.1 core.localdomain core" > /etc/hosts
mkinitcpio -P
echo "root:1423" | chpasswd
echo "====Password changed==="
grub-install –target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
EOF
echo "Install finished now reboot"
