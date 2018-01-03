#!/bin/bash

refresh_rate=0.1

body() {
    getvolume.sh
}

while [[ true ]]; do
    body
    sleep ${refresh_rate}
done
