# oh-my-bash 
export OSH=/home/roar/.oh-my-bash
OSH_THEME="font"
source $OSH/oh-my-bash.sh

# editor 
export EDITOR='nvim'
alias vim="nvim"

# git
source /etc/bash_completion.d/git-prompt 

alias gst="git status"
alias fe="nautilus --browser"

# c
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib/x86_64-linux-gnu/:/usr/lib"

CSCOPE_DB=/home/roar/fun/git/linux/cscope.out
export CSCOPE_DB


# java
export JAVA_HOME="/home/roar/.jdks/openjdk-17.0.2"
# maven autocompletion 
. ~/.maven_bash_completion.bash

# home dir
cd ~/fun/git/linux
















########## Print stuff ##########
GREEN='\033[0;32m'
NC='\033[0m' # No Color

BG_GRAY='\e[48;5;234m'

BG_RED='\e[48;5;52m'


printf "\n"
printf "  ===========================================================\n"
printf "\n"
printf "     Spend time ${GREEN}HERE${NC}, no ${GREEN}Google${NC}, ONLY ${GREEN}man pages${NC}\n"
printf "     Learn \e[48;5;67;1;5mBASH${NC} scripting?  \n"
printf "     However, if you need to use the browser NO ${BG_RED}YOUTUBE${NC} \n"
printf "\n"
printf "  ===========================================================\n"
printf "\n"

printf "     ${BG_GRAY}git --no-pager${NC} \n" 
printf "     ${BG_GRAY}git grep -l TODO${NC}\n" 
printf "     ${BG_GRAY}git blame -L 100, 103 symbol.c${NC}\n"
printf "     ${BG_GRAY}git checkout \$(git --no-pager log | grep commit | tail -n 1 | awk '{print $2}')${NC}\n"
printf "\n"
printf "     ${BG_GRAY}cat test.json | python -m json.tool${NC}\n"
printf "     ${BG_GRAY}cat --number${NC} \n"
printf "\n"

printf "     ${BG_GRAY}ls -l | sed -n 2p${NC} \n"
printf "     ${BG_GRAY}ls -ld */${NC}\n"

printf "\n"

printf "         ${GREEN}ctags${NC} and ${GREEN}cscope${NC} for browsing codebases\n"
printf "           - qemu-system-x86_64 -kernel bzImage -m 1024M -initrd initrd.img \n"
printf "           - mkinitramfs -o initrd.img \n\n"
