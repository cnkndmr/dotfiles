#!/bin/sh
mkdir ~/Documents/PDFs/uni-pdfs
rm ~/Documents/PDFs/uni-pdfs/*
find ~/Dropbox/uni-pdfs -name "*\.pdf" -exec ln -s {} ~/Documents/PDFs/uni-pdfs \;
choice=$(find ~/Documents/PDFs | grep ".pdf" | dmenu -p 'PDFS:' -i -l 20)
#editor=$(echo "evince\nmasterpdfeditor5" | dmenu -p "Select PDF editor:")
editor=evince
[ "$(echo $choice | awk 'NF' | wc -l)" -eq "0" ] && exit
$editor "$choice"
