#!/bin/bash

create-status-fifo.sh screencapture
create-status-fifo.sh mouse '1'

feh --bg-scale ~/dotfiles/look/Wallpapers/particles.jpg
nm-applet &
xset b off &
