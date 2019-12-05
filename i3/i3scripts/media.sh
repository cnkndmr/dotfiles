#!/bin/bash
# Dependencies: youtube-dl, mpv, ffmpeg
LINK=$(xclip -o)

twitch_watch() {
	notify-send "Twitch watch mode"
	# FORMATS=$(youtube-dl -F $LINK | sed "s/$/\\\n/")
	# CHOICE=$(echo -e $FORMATS | grep 'mp4' | awk '{print $1}' | sed '/^$/d' | dmenu -p "Select the quality of video:")
	CHOICE=720p
	mpv --ytdl-format=$CHOICE $LINK
}

youtube_watch() {
	notify-send "Youtube watch mode"
	#	FORMATS=$(youtube-dl -F $LINK | sed "s/$/\\\n/")
	#	AUDIO_FORMAT=$(echo -e $FORMATS | grep 'audio\ only' | grep 'm4a' | tail -n1 | awk '{print $1}')
	#	CHOICE=$(echo -e $FORMATS | grep 'video\ only' | grep 'mp4' | awk '{print $4}' | sed '/^$/d' | dmenu -p "Select the quality of video:")
	#	VIDEO_FORMAT=$(echo -e $FORMATS | grep 'video\ only' | grep 'mp4' | grep $CHOICE | awk '{print $1}')
	#	mpv --ytdl-format=$VIDEO_FORMAT+bestaudio[ext=m4a] $LINK
	mpv --ytdl-format="bestvideo[height<=?1080][fps<=?60]+bestaudio[ext=m4a]" $LINK
}

other_watch() {
	notify-send "Other watch mode"
    mpv $LINK
}

watch_choose() {
	if [ $(echo $LINK | grep "https://www.twitch.tv" | wc -l) -eq "1" ]
	then
		twitch_watch
	elif [ $(echo $LINK | grep "https://www.youtube.com/" | wc -l) -eq "1" ]
	then
		 youtube_watch
	else
		other_watch
	fi
}

twitch_download() {
	notify-send "Twitch download mode"
	FORMATS=$(youtube-dl -F $LINK | sed "s/$/\\\n/")
	VIDEO_FORMAT=$(echo -e $FORMATS | grep 'mp4' | awk '{print $1}' | sed '/^$/d' | dmenu -p "Select the quality of video:")
	[ "$(echo $CHOICE | awk 'NF' | wc -l)" -eq "0" ] && notify-send "Cancelled" && exit
	notify-send "Download started."
	youtube-dl -f "$VIDEO_FORMAT" $LINK -o "$DOWNLOAD_LOC/%(title)s.%(ext)s"
}

youtube_download() {
	notify-send "Youtube download mode"
	FORMATS=$(youtube-dl -F $LINK | sed "s/$/\\\n/")
	#	AUDIO_FORMAT=$(echo -e $FORMATS | grep 'audio\ only' | grep 'm4a' | tail -n1 | awk '{print $1}')
	CHOICE=$(echo -e $FORMATS | grep 'video\ only' | grep 'mp4' | awk '{print $4}' | sed '/^$/d' | dmenu -p "Select the quality of video:")
	VIDEO_FORMAT=$(echo -e $FORMATS | grep 'video\ only' | grep 'mp4' | grep $CHOICE | awk '{print $1}')
	[ "$(echo $CHOICE | awk 'NF' | wc -l)" -eq "0" ] && notify-send "Cancelled" && exit
	notify-send "Download started."
	youtube-dl -f "$VIDEO_FORMAT+bestaudio[ext=m4a]" $LINK -o "$DOWNLOAD_LOC/%(title)s.%(ext)s"
}

other_download() {
	notify-send "Other download mode"
	notify-send "Download started."
	youtube-dl $LINK -o "$DOWNLOAD_LOC/%(title)s.%(ext)s"
}

download_choose() {
	if [ $(echo $LINK | grep "https://www.twitch.tv" | wc -l) -eq "1" ]
	then
		twitch_download
	elif [ $(echo $LINK | grep "https://www.youtube.com/" | wc -l) -eq "1" ]
	then
		 youtube_download
	else
		other_download
	fi
}

case "$1" in
    '-d'|'--dw')
		DOWNLOAD_LOC=$(echo -e "~/Downloads\n/media/$(whoami)/HDD_CAN/Downloads/Youtube" | dmenu -i -p "Select download location:")
		download_choose
		notify-send "Download finished."
		;;
	*)
		watch_choose
		notify-send "Player closed."
		;;
esac
