#!/bin/sh
case "$1" in
	'-e')
		editor=masterpdfeditor5
		;;
	*)
		editor=evince
		;;
esac
rm -rf ~/Documents/PDFs/uni-pdfs
mkdir ~/Documents/PDFs/uni-pdfs
lndir ~/Dropbox/uni-pdfs ~/Documents/PDFs/uni-pdfs
choice=$(find ~/Documents/PDFs | grep "\.pdf" | dmenu -p 'PDFS:' -i -l 20)
[ "$(echo "$choice" | awk 'NF' | wc -l)" -eq "0" ] && exit
# editor=$(echo "evince\nmasterpdfeditor5" | dmenu -p "Select PDF editor:")
# [ "$(echo "$editor" | awk 'NF' | wc -l)" -eq "0" ] && exit
# editor=evince
$editor "$choice"
