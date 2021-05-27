BRIGHTNESS=$(/usr/bin/brightnessctl i  | sed -n '2 p' | awk '{print $3}')
echo $BRIGHTNESS
