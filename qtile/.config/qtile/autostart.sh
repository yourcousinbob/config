#!/usr/bin/env bash 
# Wallpaper
./wallpaper.sh &

# Media Controller
playerctld daemon &

# Notifications
wired &

# Clipboard
clipster -d &

# Compositor
picom -b


