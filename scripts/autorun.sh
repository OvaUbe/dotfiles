#!/bin/bash

create-status-fifo.sh screencapture
create-status-fifo.sh mouse '1'

feh --bg-fill ~/dotfiles/look/wallpaper
nm-applet &
xset b off &
unclutter -idle 2 &
