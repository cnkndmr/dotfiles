#!/bin/sh

timedatectl set-ntp true
mkfs.fat -F32 /dev/sda1
mkswap /dev/sda2
swapon /dev/sda2
mkfs.ext4 /dev/sda3
mount /dev/sda3 /mnt
curl -Ss "https://www.archlinux.org/mirrorlist/?country=DE&protocol=http&protocol=https&ip_version=4" | sed 's/^#//' > /etc/pacman.d/mirrorlist
pacstrap -i /mnt base base-devel linux linux-firmware nano networkmanager grub efibootmgr
genfstab -U -p /mnt >> /mnt/etc/fstab
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
mkdir /boot/efi
mount /dev/sda1 /boot/efi
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi --recheck
grub-mkconfig -o /boot/grub/grub.cfg
mkdir /boot/efi/EFI/BOOT
cp /boot/efi/EFI/GRUB/grubx64.efi /boot/efi/EFI/BOOT/BOOTX64.EFI
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
