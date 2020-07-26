# Arch Linux Mate-i3 Setup <!-- omit in toc -->

---

# Table of Contents <!-- omit in toc -->

- [1. Installing Arch Linux](#1-installing-arch-linux)
  - [1.1. Arch install script (Legacy bios)](#11-arch-install-script-legacy-bios)
- [2. List of Programs](#2-list-of-programs)
  - [2.1. Base setup (This part will auto installed in Arch install script)](#21-base-setup-this-part-will-auto-installed-in-arch-install-script)
  - [2.2. Main packages](#22-main-packages)
  - [2.3. Additional packages](#23-additional-packages)
- [3. Programs](#3-programs)
  - [3.1. Desktop Environment](#31-desktop-environment)
    - [3.1.1. Mate](#311-mate)
    - [3.1.2. i3](#312-i3)
  - [3.2. Terminal](#32-terminal)
    - [3.2.1. Mate-Terminal](#321-mate-terminal)
    - [3.2.2. Zsh](#322-zsh)
  - [3.3. Browsers](#33-browsers)
    - [3.3.1. Firefox](#331-firefox)
    - [3.3.2. Chromium](#332-chromium)
  - [3.4. Text Editors](#34-text-editors)
    - [3.4.1. Emacs](#341-emacs)
    - [3.4.2. Vscode](#342-vscode)
  - [3.5. Media Viewers](#35-media-viewers)
    - [3.5.1. Zathura](#351-zathura)
    - [3.5.2. Mpv](#352-mpv)

---

# 1. Installing Arch Linux

Preferably arch linux must be installed via [Arch wiki installation guide](https://wiki.archlinux.org/index.php/installation_guide). But I created an script for arch installation because while testing out this rice on WMs it needs to be installed quickly.

## 1.1. Arch install script (Legacy bios)

Before running arch install script partitions must be prepared. Partitions can be created via **cfdisk** command.

- cfdisk
  - dos
    1. [Partition 1], 14GB (Assuming 16GB storage), bootable
    2. [Partition 2 (for swap)], 2GB, [Type] > 82 Linux swap/Solaris
    3. [Write] > yes
    4. [Quit]

After creating partitions, mate and other essentials can be install via script:

```sh
sh -c "$(curl -fsSL https://git.io/JJ8Dm)"
```

**NOTE**: User passwords in script are chosen as simple it can be because of this is not an proper installation. Must be change after install.

# 2. List of Programs

## 2.1. Base setup (This part will auto installed in [Arch install script](#arch-install-script-legacy-bios))

1. mate
2. mate-terminal
3. xorg
4. xorg-server
5. lightdm
6. lightdm-gtk-greeter
7. sudo

## 2.2. Main packages

8. mate-extra
9. git
10. i3-gaps
11. dmenu
12. network-manager-applet
13. firefox
14. chromium
15. emacs
16. dconf
17. dconf-editor
18. base-devel
19. pulseaudio
20. ttf-ubuntu-font-family
21. picom
22. arc-gtk-theme-git (yay)
23. numix-icon-theme-git (yay)

## 2.3. Additional packages

24. zathura
25. mpv
26. transmission
27. zsh
28. keepass
29. meld
30. redshift
31. shellcheck
32. youtube-dl

# 3. Programs

## 3.1. Desktop Environment

### 3.1.1. Mate

### 3.1.2. i3

## 3.2. Terminal

### 3.2.1. Mate-Terminal

### 3.2.2. Zsh

## 3.3. Browsers

### 3.3.1. Firefox

### 3.3.2. Chromium

## 3.4. Text Editors

### 3.4.1. Emacs

### 3.4.2. Vscode

## 3.5. Media Viewers

### 3.5.1. Zathura

### 3.5.2. Mpv
