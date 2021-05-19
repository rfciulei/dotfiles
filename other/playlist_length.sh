#! /bin/bash

# Script that will output the total length of mp4 files in the current folder

# COLORS
GREEN='\033[0;32m' 
NC='\033[0m' 

# INIT VARS
TOTAL_HOURS=0 
TOTAL_MINUTES=0
read -p "Total videos length starting from video number:" STARTING_VIDEO

echo "Processing..."

NR_OF_VIDEOS=$(ls | grep .mp4 | wc -l | bc)

for ((i = STARTING_VIDEO; i <= NR_OF_VIDEOS; i++));do

    FILENAME="curs$i.mp4"
	DURATION=$(ffmpeg -i $FILENAME 2>&1 | grep Duration | cut -d ' ' -f 4 | sed s/,//)

	HOURS=$(echo $DURATION | awk -F ':' '{print $1}')
	MINUTES=$(echo $DURATION | awk -F ':' '{print $2}')
	
	TOTAL_HOURS=$(echo "$TOTAL_HOURS + $HOURS" | bc)
	#TOTAL_MINUTES=$(echo "$TOTAL_MINUTES + $MINUTES" | bc) 
	# - 10 minutes each time for pauses
	TOTAL_MINUTES=$(echo "$TOTAL_MINUTES + $MINUTES - 10" | bc) 

done

TOTAL_HOURS=$(echo "$TOTAL_HOURS + $TOTAL_MINUTES / 60" | bc)
TOTAL_MINUTES=$(echo "$TOTAL_MINUTES % 60" | bc)

echo -e "${GREEN}[DONE]: ${NC}$TOTAL_HOURS hours $TOTAL_MINUTES minutes."
