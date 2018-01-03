#!/bin/bash

refresh_rate=1

body() {
    getbattery.sh -r "<fc=#781A0F>" -g "<fc=#428842>" -b "<fc=#37648C>" -e "</fc>"
}

while [[ true ]]; do
    body
    sleep ${refresh_rate}
done
