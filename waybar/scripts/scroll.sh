#!/bin/bash

SCRIPT="$HOME/.config/waybar/scripts/playerctl.sh"

zscroll -l 30 -d 0.1 -p "     " -M "$SCRIPT --status" -m "Playing" "--scroll 1" -m "Paused" "--scroll 0" -u true "$SCRIPT" &
wait
