#!/bin/bash
timeout='10000'
scrot /tmp/screen.png
convert /tmp/screen.png -paint 1 -swirl 360 /tmp/screen.png
i3lock -e -f -i /tmp/screen.png
