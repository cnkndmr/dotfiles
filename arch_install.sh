#!/bin/bash

timedatectl set-ntp true
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk /dev/sda
o # clear the in memory partition table
n # new partition
p # primary partition
1 # partition number 1
    # default - start at beginning of disk 
+100M # 100 MB boot parttion
n # new partition
p # primary partition
2 # partion number 2
    # default, start immediately after preceding partition
    # default, extend partition to end of disk
a # make a partition bootable
1 # bootable partition is partition 1 -- /dev/sda1
p # print the in-memory partition table
w # write the partition table
q # and we're done
EOF
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
echo "root:1234" | chpasswd
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable NetworkManager
pacman -S --noconfirm mate mate-terminal xorg xorg-server lightdm lightdm-gtk-greeter sudo
systemctl enable lightdm
echo "greeter-session = lightdm-gtk-greeter" >> /etc/lightdm/lightdm.conf
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
useradd -m -G wheel can
echo "can:1423" | chpasswd
EOF
umount -R /mnt
echo "Install finished now reboot"
