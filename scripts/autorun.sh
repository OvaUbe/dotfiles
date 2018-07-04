#!/bin/bash

create-status-fifo.sh screencapture
create-status-fifo.sh mouse

feh --bg-scale ~/dotfiles/look/Wallpapers/particles.jpg
nm-applet &
xset b off &
