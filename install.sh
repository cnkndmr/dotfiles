#!/bin/sh

# Refresh mirrorlist
sudo cp ./mirrorlist /etc/pacman.d/mirrorlist

sudo pacman -Syu

# Install packages
./install_base.sh

# i3 setup
mkdir -p ~/.config/i3
cp ./.config/i3/config ~/.config/i3

dconf load / < dconf

i3-msg restart

./install_yay.sh
