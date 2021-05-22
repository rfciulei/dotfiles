# oh-my-bash 
export OSH=/home/roar/.oh-my-bash
export EDITOR='nvim'
OSH_THEME="font"
source $OSH/oh-my-bash.sh

alias vim="nvim"
alias gst="git status"
alias f="nautilus --browser"

# uptime
uptime -p | sed 's/^up //' | awk '{print "Uptime: "$0""}'
cd ~/dev
