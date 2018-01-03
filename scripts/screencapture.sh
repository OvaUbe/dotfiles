#!/bin/bash

record_pid_variable=~/.global-state/SCREENCAPTURE_RECORD_PID
fifo=$(cat ~/.global-state/SCREENCAPTURE_STATUS_FIFO)
record_pid=$(cat ${record_pid_variable})

if [[ -n ${record_pid} ]]; then
    kill -SIGTERM ${record_pid}

    echo "" > ${record_pid_variable}
    echo "0" > ${fifo}

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
echo ${record_pid} > ${record_pid_variable}
echo "1" > ${fifo}
