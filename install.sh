#!/bin/sh

sudo pacman -Syu --noconfirm

# Install packages
./install_base.sh

# i3 setup
mkdir -p ~/.config/i3
cp ./.config/i3/config ~/.config/i3

dconf load / < dconf

mkdir -p ~/.emacs.d
cp ./.emacs.d/init.el ~/.emacs.d

./install_yay.sh

pkill -KILL -u "$(whoami)"
