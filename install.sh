#!/bin/bash

sudo pacman -Syu --noconfirm

## yay installation part
sudo pacman -S --noconfirm git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

# Install base packages
sudo pacman -S --noconfirm --needed - < pkglist.txt

# i3 setup
mkdir -p ~/.config/i3
cp ./.config/i3/config ~/.config/i3

dconf load / < dconf

mkdir -p ~/.emacs.d
cp ./.emacs.d/init.el ~/.emacs.d

pkill -KILL -u "$(whoami)"
