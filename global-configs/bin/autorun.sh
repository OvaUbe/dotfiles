#!/bin/bash

create-status-fifo.sh screencapture
create-status-fifo.sh mouse '1'

feh --bg-fill ~/.look/wallpaper
xinput-toggle.sh 12
nm-applet &
xset b off &
unclutter -idle 2 &
xrdb -merge ~/.config/xrdb/nord
