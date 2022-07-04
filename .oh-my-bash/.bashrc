# oh-my-bash 
export OSH=$HOME/.oh-my-bash
OSH_THEME="font"
source $OSH/oh-my-bash.sh

# editor 
export EDITOR='nvim'
alias vim="nvim"

# git
source /etc/bash_completion.d/git-prompt 

# other
alias gst="git status"
alias fe="nautilus --browser"

# c
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib/x86_64-linux-gnu/:/usr/lib"

# java
export JAVA_HOME="$HOME/.jdks/openjdk-17.0.2"
export JDK_HOME="$HOME/.jdks/openjdk-17.0.2" 
export PATH=$JDK_HOME/bin:$PATH

# maven autocompletion 
. $HOME/.maven_bash_completion.bash


#############################
GREEN='\033[0;32m'
NC='\033[0m'
printf "\n"
printf "running the linux ${GREEN}kernel${NC} :\n"
printf "  - mkinitramfs -o initrd.img \n"
printf "  - qemu-system-x86_64 -kernel arch/x86/boot/bzImage -m 1024M -initrd initrd.img \n\n"
