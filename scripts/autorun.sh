#!/bin/bash

create-status-fifo.sh screencapture

feh --bg-scale ~/dotfiles/look/Wallpapers/particles.jpg
nm-applet &
xset b off &
