#!/bin/sh
swayidle \
    timeout 5 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' &
# lcok screen
swaylock -c 500000
pid="$!"
# kill last background task
kill "$pid"
