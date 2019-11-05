#!/bin/bash

device=${1}
state=$(xinput list-props "$device" | grep "Device Enabled" | grep -o "[01]$")

if [ $state == '1' ];then
  xinput --disable "$device"
  echo '0'
else
  xinput --enable "$device"
  echo '1'
fi
