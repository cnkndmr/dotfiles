#!/bin/sh

sudo pacman -Syu

# Install packages
./install_base.sh

# i3 setup
mkdir -p ~/.config/i3
cp ./.config/i3/config ~/.config/i3

dconf load / < dconf

./install_yay.sh

pkill -KILL -u "$(whoami)"
