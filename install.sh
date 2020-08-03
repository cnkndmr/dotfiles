#!/bin/bash

sudo pacman -Syu --noconfirm

sudo pacman -S --noconfirm git

git clone https://github.com/cnkndmr/dotfiles.git

cd dotfiles

# Install base packages
sudo pacman -S --noconfirm --needed - < pkglist.txt

# yay installation part
sudo pacman -S --noconfirm git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

# Install yay packages
yay -S --noconfirm --needed - < pkglist_yay.txt

# Copying configs
mkdir -p ~/.config
cp -r ./home ~/

# Loading preferences
dconf load / < dconf

pkill -KILL -u "$(whoami)"
