#!/bin/bash

create-status-fifo.sh screencapture
create-status-fifo.sh mouse '1'

feh --bg-scale ~/dotfiles/look/Wallpapers/44448476472_ff77fa00fd_o.jpg
nm-applet &
xset b off &
unclutter -idle 2 &
