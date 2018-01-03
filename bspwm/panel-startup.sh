#! /bin/bash

bspc config top_padding $BSPWM_PANEL_HEIGHT
bspc subscribe report | ~/.config/bspwm/bspwm-to-xmobar.sh | xmobar &
