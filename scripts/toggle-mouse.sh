#!/bin/bash

xinput-toggle.sh 11 && xinput-toggle.sh 12 > `cat ~/.global-state/MOUSE_STATUS_FIFO`
