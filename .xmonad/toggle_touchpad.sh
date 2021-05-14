DEVICE=$(xinput list | grep -P 'Touchpad' |grep -oP '(?<=id=)\d\d')
ENABLED=$(xinput --list-props $DEVICE | grep 'Device Enabled' | awk '{print $4}')

if [ "1" == "$ENABLED" ]; then
	$(xinput disable $DEVICE)
else 
	$(xinput enable $DEVICE)
fi

