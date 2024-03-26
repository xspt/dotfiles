#!/bin/bash

. "$HOME/.cache/wal/colors.sh"

case "$(echo -e "󰐥 Desligar\n󰜉 Reiniciar\n Suspender\n󰿅 Sair" | tofi \
    --padding-left 2% \
    --prompt-text "" \
    --placeholder-text "Power-menu:" \
    --placeholder-color "$color3" \
    --text-cursor false \
    --border-color "$color1" \
    --selection-background "$color1" \
    --selection-background-padding "0, 7" \
    --selection-color "$background" \
    --result-spacing 5 \
    --prompt-padding 0 \
    --width 205 \
    --height 200)" in
        "󰐥 Desligar") exec shutdown now;;
	"󰜉 Reiniciar") exec shutdown -r now;;
   " Suspender") exec systemctl suspend;;
	"󰿅 Sair") exec swaymsg exit;;
esac
