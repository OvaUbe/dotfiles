#!/bin/bash

. ~/.config/multihead/config

bspc monitor ${builtin_monitor} -d b1 b2 b3 b4 b5
bspc monitor ${external_monitor} -d e1 e2 e3 e4 e5
