# Arch i3-Mate Setup

## Legacy bios setup

### 1. Preparing partitions

- cfdisk
  - dos
     1. Partition 1, 13G, bootable
     2. Partition 2 (for swap), 2G, [ Type ] > 82 Linux swap /Solaris
     3. [ Write ] > yes > [ Quit ]

### 2. Running installation scripts

sh -c "\$(curl -fsSL https://git.io/JfmMb)"
