#!/bin/sh
swayidle \
    timeout 5 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' &
# lcok screen
swaylock -c 500000 --inside-color 500000 --ring-color 000000 --key-hl-color 500000
pid="$!"
# kill last background task
kill "$pid"
