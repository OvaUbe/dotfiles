#!/bin/bash

create-status-fifo.sh screencapture

feh --bg-scale ~/dotfiles/look/Wallpapers/aoi-bungaku-1.png
telegram &
deluge &
nm-applet &
xset b off &
