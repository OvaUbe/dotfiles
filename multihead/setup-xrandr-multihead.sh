#!/bin/bash

. ~/.config/multihead/config

xrandr --output ${builtin_monitor} --below ${external_monitor}
