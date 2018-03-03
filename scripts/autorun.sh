#!/bin/bash

create-status-fifo.sh screencapture

gifbg.sh ~/dotfiles/look/Wallpapers/beesnbombs-flower.gif &
feh --bg-scale ~/dotfiles/look/Wallpapers/solid-EEEEEE-1920x1080.jpg
nm-applet &
xset b off &
