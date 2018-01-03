#!/bin/bash

record_pid_variable="SCREENCAPTURE_RECORD_PID"

if [[ ${1} == "-k" ]]; then
    kill -SIGTERM $(cat ~/.global-state/${record_pid_variable})
    exit 0
fi

screen_resolution=$(xrandr -q --current | grep '*' | awk '{print$1}')
timestamp=$(date +"%Y-%m-%d-%H%M%S")
filename=${timestamp}_${screen_resolution}_cap.mkv

ffmpeg -video_size ${screen_resolution} \
       -framerate 25 \
       -f x11grab \
       -i :0.0+0,0 \
       -f alsa \
       -ac 2 \
       -i default \
       ~/scrots/${filename} &

record_pid=$(echo $!)
echo ${record_pid} > ~/.global-state/${record_pid_variable}
