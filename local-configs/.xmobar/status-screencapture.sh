#!/bin/bash

screencapture_fifo=$(cat ~/.global-state/SCREENCAPTURE_STATUS_FIFO)

format() {
    if [[ $1 == "1" ]]; then
        echo "<fc=#781A0F>R</fc>"
    else
        echo ""
    fi
}

body() {
    status=$(cat ${screencapture_fifo})
    format "${status}"
}

while [[ true ]]; do
    body
done
