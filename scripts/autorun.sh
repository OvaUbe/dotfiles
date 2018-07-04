#!/bin/bash

create-status-fifo.sh screencapture
create-status-fifo.sh mouse

feh --bg-scale ~/dotfiles/look/Wallpapers/particles.jpg
nm-applet &
xset b off &
yt-fuse banach /mnt/banach --enable-logging 2> ~/.yt-fuse/mnt-banach.log &
yt-fuse freud /mnt/freud --enable-logging 2> ~/.yt-fuse/mnt-freud.log &
unclutter -idle 2 &
