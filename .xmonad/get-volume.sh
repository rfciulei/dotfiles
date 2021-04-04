MASTER_RUNNING=$(pactl list sinks | grep -oP '(?<=State:\s)(\w+)' | awk 'NR==1{print $1'})

if [[ $MASTER_RUNNING == "SUSPENDED" ]]; then 
	echo $(pactl list sinks | grep -P '(?<!Base)\sVolume:' | awk 'NR==2{print $5}')
else
	echo $(pactl list sinks | grep -P '(?<!Base)\sVolume:' | awk 'NR==1{print $5}')
fi 
