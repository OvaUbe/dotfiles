#!/bin/bash

mouse_fifo=$(cat ~/.global-state/MOUSE_STATUS_FIFO)

format() {
    if [[ $1 == "1" ]]; then
        echo "<fc=#428842>mouse on</fc>"
    else
        echo "<fc=#781A0F>mouse off</fc>"
    fi
}

body() {
    status=$(cat ${mouse_fifo})
    format "${status}"
}

while [[ true ]]; do
    body
done
