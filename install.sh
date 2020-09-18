#!/bin/bash

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm archlinux-keyring
sudo pacman -S --noconfirm git

git clone https://github.com/cnkndmr/dotfiles.git

cd dotfiles

# Install base packages
sudo pacman -S --noconfirm --needed - < pkglist.txt

# yay installation part
sudo pacman -S --noconfirm base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

# Install yay packages
yay -S --noconfirm --needed - < pkglist_yay.txt

# Copying configs
cd ./home
cp -R . ~/
cd ..

# Install zsh, antigen
sudo pacman -S --noconfirm zsh
mkdir -p ~/.config/antigen
curl -L git.io/antigen > ~/.config/antigen/antigen.zsh
chsh -s /usr/bin/zsh

# Loading preferences
dconf load / < dconf

echo "Press enter to restart:"
read

pkill -KILL -u "$(whoami)"
