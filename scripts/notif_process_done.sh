#! /usr/bin/bash

eval $@
wait

export DISPLAY=:0 
NOTIF="$@ finished."
$(/usr/bin/notify-send "$NOTIF" -u NORMAL) 

play /home/roar/scripts/resources/work-done.mp3 >/dev/null 2>/dev/null & 
