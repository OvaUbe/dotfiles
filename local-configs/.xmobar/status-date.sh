#!/bin/bash

refresh_rate=1

format() {
    echo "<fc=#ABABAB> $1 </fc>"
}

body() {
    date_string=$(date +"%F (%a) %T")
    format "${date_string}"
}

while [[ true ]]; do
    body
    sleep ${refresh_rate}
done
