#!/bin/bash

. ~/.config/multihead/config

xrandr --output ${builtin_monitor} --left-of ${external_monitor}
xrandr --output ${external_monitor} --scale 0.9x0.9
