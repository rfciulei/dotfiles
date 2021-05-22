export OSH=/home/roar/.oh-my-bash
export EDITOR='nvim'

OSH_THEME="font"
source $OSH/oh-my-bash.sh

alias vim="nvim"
alias gst="git status"
alias f="nautilus --browser"

# uptime
uptime -p | sed 's/^up //' | awk '{print "Uptime: "$0""}'

# for xmonad -> enable tapping and natural scrolling 
DEVICE=$(xinput list | grep -P 'Touchpad' |grep -oP '(?<=id=)\d\d')
ID_NATSCROLL=$(xinput list-props $DEVICE | grep -P 'Natural Scrolling Enabled \(' | grep -oP '\d{3}')
ID_TAPPING=$(xinput list-props $DEVICE | grep -P 'Tapping Enabled \(' | grep -oP '\d{3}')

$(xinput set-prop $DEVICE $ID_NATSCROLL 1)
$(xinput set-prop $DEVICE $ID_TAPPING 1)
$(xrandr --output "HDMI-A-0" --auto --output eDP --auto --below HDMI-A-0)

cd ~/dev
