#! /bin/sh
UPTIME=$(uptime -p | sed 's/^up //' | awk '{print "Uptime: "$0""}')
		
export DISPLAY=:0 
$(/usr/bin/notify-send "$UPTIME" -u NORMAL) 

