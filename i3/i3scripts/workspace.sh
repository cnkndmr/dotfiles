#!/bin/sh
choice=$(ls ~/Dev/gits | dmenu -l $(ls ~/Dev/gits | wc -l))
[ "$(echo $choice | awk 'NF' | wc -l)" -eq "0" ] && exit
caja ~/Dev/gits/$choice &
mate-terminal --working-directory="Dev/gits/$choice" &
