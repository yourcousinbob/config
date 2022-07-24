#!/usr/bin/env bash 
# Walpaper
nitrogen ./arch.jpg &

# Media Controller
playerctld daemon &

# Notifications
wired &

# Clipboard
clipster -d &

# Compositor
picom -b


