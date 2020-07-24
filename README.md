# Arch Linux Mate-i3 Setup

---

# Table of Contents

- [Installing Arch linux](#installing-arch-linux)
  - [Arch install script (Legacy bios)](#arch-install-script-legacy-bios)
- [List of Programs](#list-of-programs)
  - [Base setup (This part will auto installed in Arch install script)](#base-setup-this-part-will-auto-installed-in-arch-install-script)
  - [Main packages](#main-packages)
  - [Additional packages](#additional-packages)
- TODO Customization
  - TODO Mate panel
  - TODO Dconf config

---

# Installing Arch linux

Preferably arch linux must be installed via [arch wiki installation guide](https://wiki.archlinux.org/index.php/installation_guide). But I created an script for arch installation because while testing out this rice on WMs it needs to be installed quickly.

## Arch install script (Legacy bios)

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

# List of Programs

## Base setup (This part will auto installed in [Arch install script](#arch-install-script-legacy-bios))

1. mate
2. mate-terminal
3. xorg
4. xorg-server
5. lightdm
6. lightdm-gtk-greeter
7. sudo

## Main packages

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

## Additional packages

24. zathura
25. mpv
26. transmission
27. zsh
28. keepass
29. meld
30. redshift
31. shellcheck
32. youtube-dl
