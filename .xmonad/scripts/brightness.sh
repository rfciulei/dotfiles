#! /bin/bash

BRIGHTNESS=$(/usr/bin/brightnessctl i  | sed -n '2 p' | awk '{print $3}')

if [ "$1" = "increase" ]; then
	if [ $BRIGHTNESS -lt 225 ]; then
		NEW_VALUE=$(echo $( echo "$BRIGHTNESS+25" | bc))
		COMMAND="/usr/bin/brightnessctl s $NEW_VALUE"
		eval $COMMAND
	fi 
else
	if [ $BRIGHTNESS -gt 50 ];then
		NEW_VALUE=$(echo $( echo "$BRIGHTNESS-25" | bc))
		COMMAND="/usr/bin/brightnessctl s $NEW_VALUE"
		eval $COMMAND
	fi 
fi

