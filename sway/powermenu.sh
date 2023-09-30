#!/bin/bash

case "$(echo -e "󰐥 Desligar\n󰜉 Reiniciar\n󰿅 Sair" | tofi \
    --padding-left 2% \
    --prompt-text "" \
    --placeholder-text "Power-menu:" \
    --placeholder-color "#eed49f" \
    --text-cursor false \
    --border-color "#ed8796" \
    --selection-background "#ed8796" \
    --selection-background-padding "0, 7" \
    --selection-color "#181926" \
    --result-spacing 5 \
    --prompt-padding 0 \
    --width 205 \
    --height 170)" in
        "󰐥 Desligar") exec shutdown now;;
	"󰜉 Reiniciar") exec shutdown -r now;;
	"󰿅 Sair") exec swaymsg exit;;
esac
