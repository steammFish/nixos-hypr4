#!/usr/bin/env bash

# 壁纸路径
WALLPAPER=~/Pictures/minimalist-abstract-moon-night-scenery-landscape-uhdpaper.com-4K-8.2518.jpg
# wallpapers/anime-girl-playing-guitar-4k-wallpaper-uhdpaper.com-171@1@n.jpg
# anime-girl-magic-art-white-hair-4k-wallpaper-uhdpaper.com-918@0@i.jpg
# 1275408.jpg

pkill waybar || true
pkill swww || true

wal -i "$WALLPAPER"
swww init && swww img "$WALLPAPER"
waybar
