#!/bin/bash

create-status-fifo.sh screencapture
create-status-fifo.sh mouse '1'

feh --bg-scale ~/dotfiles/look/Wallpapers/43780441264_4dae593330_o.jpg
nm-applet &
xset b off &
yt-fuse banach /mnt/banach --enable-logging 2> ~/.yt-fuse/mnt-banach.log &
yt-fuse freud /mnt/freud --enable-logging 2> ~/.yt-fuse/mnt-freud.log &
unclutter -idle 2 &
