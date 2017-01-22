#!/bin/bash

wallpaper=$1
autorun=`which autorun.sh`
set_wallpaper="feh --bg-scale"

contains=`grep "$set_wallpaper" $autorun`
if [ -z "$contains" ]; then
    echo "$set_wallpaper $wallpaper &" >> $autorun
else
    sed -ie "s/$set_wallpaper.*$/$set_wallpaper ${wallpaper//\//\\/} \&/" $autorun
fi
