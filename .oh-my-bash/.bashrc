# oh-my-bash 
export OSH=/home/roar/.oh-my-bash
OSH_THEME="font"
source $OSH/oh-my-bash.sh

# EDITOR 
export EDITOR='nvim'
alias vim="nvim"

# GIT
source /etc/bash_completion.d/git-prompt 

alias gst="git status -s"
alias gd="git diff"
alias f="nautilus --browser"
alias ls="ls --group-directories-first -h --color=auto"
alias qemu="qemu-system-i386"
alias gdb="gdb -q"

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib/x86_64-linux-gnu/:/usr/lib"
