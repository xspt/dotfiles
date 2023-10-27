#!/bin/bash

PLAYER="spotify"

FORMAT="{{artist}} - {{title}}"

PLAYERCTL_STATUS=$(playerctl --player=$PLAYER status 2>/dev/null)
EXIT_CODE=$?

if [ $EXIT_CODE -eq 0 ]; then
	STATUS=$PLAYERCTL_STATUS
else
	STATUS="No player running"
fi

if [ "$1" == "--status" ]; then
	echo "$STATUS"
else
	if [ "$STATUS" = "Stopped" ]; then
		echo "No media playing"
	elif [ "$STATUS" = "Paused"  ]; then
		echo "* Paused *"
	elif [ "$STATUS" = "No player running"  ]; then
		echo "$STATUS"
	else
		music=$(playerctl --player=$PLAYER metadata --format "$FORMAT")
		if [[ "$music" == *"&"* ]]; then
			echo "${music//&/and}"
		else
			echo "$music"
		fi
	fi
fi
