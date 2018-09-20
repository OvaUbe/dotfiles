#!/bin/bash

create-status-fifo.sh screencapture
create-status-fifo.sh mouse '1'

feh --bg-scale ~/dotfiles/look/Wallpapers/43780441264_4dae593330_o.jpg
xinput-toggle.sh 12
nm-applet &
xset b off &
unclutter -idle 2 &
