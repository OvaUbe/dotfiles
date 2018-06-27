#!/bin/bash

. ~/.config/multihead/config

xrandr --output ${builtin_monitor} --left-of ${external_monitor}
