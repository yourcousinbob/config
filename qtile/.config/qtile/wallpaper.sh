#!/usr/bin/env bash
WALLPAPER_PATH=~/temo/Media/Wallpapers

while true; do
    ls $WALLPAPER_PATH |sort -R |tail -$N |while read file; do
        xwallpaper --zoom "$WALLPAPER_PATH/$file"
        sleep 60
    done
done

