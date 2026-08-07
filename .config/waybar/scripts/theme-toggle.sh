#!/usr/bin/env bash

key="org.gnome.desktop.interface color-scheme"
scheme=$(gsettings get $key | tr -d "'")

if [[ $1 == --toggle ]]; then
	[[ $scheme == prefer-light ]] && gsettings set $key prefer-dark || gsettings set $key prefer-light
	exit
fi

icon=$''

if [[ $scheme == prefer-light ]]; then
	echo '{"text":"'"$icon"'","tooltip":"Light mode","class":"light"}'
else
	echo '{"text":"'"$icon"'","tooltip":"Dark mode","class":"dark"}'
fi
