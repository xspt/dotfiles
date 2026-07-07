#!/bin/bash

set -euo pipefail

declare -A modes
declare -A sides

# ----------------------------

center="VGA-1"
center_mode="auto"

modes["HDMI-A-1"]="auto"
sides["HDMI-A-1"]="right"

# ----------------------------

get_size() {
    local output="$1"

    niri msg -j outputs | jq -r --arg out "$output" '.[$out] | .modes[.current_mode] | "\(.width) \(.height)"'
}

niri msg output "$center" mode "$center_mode"
niri msg output "$center" position set 0 0

read -r center_w center_h <<< "$(get_size "$center")"

for output in "${!modes[@]}"; do
        niri msg output "$output" mode "${modes[$output]}"

        read -r w h <<< "$(get_size "$output")"

        case "${sides[$output]}" in
                left)
                        x=$((-w))
                        y=0
                        ;;
                right)
                        x=$((center_w))
                        y=0
                        ;;
                top)
                        x=0
                        y=$((-h))
                        ;;
                bottom)
                        x=0
                        y=$((center_h))
                        ;;
                *)
                        echo "Invalid side: ${sides[$output]}"
                        exit 1
                        ;;
        esac

        niri msg output "$output" position set -- "$x" "$y"
done
