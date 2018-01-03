#!/bin/bash

name=$1
populate=$2

fifo="/tmp/.${name}-status-fifo"
[[ -e ${fifo} ]] || mkfifo ${fifo}

variable_name=$(echo ${name} | tr '[:lower:]' '[:upper:]')_STATUS_FIFO
echo ${fifo} > ~/.global-state/"${variable_name}"

if [[ -n ${populate} ]]; then
    echo ${populate} > ${fifo} &
fi
