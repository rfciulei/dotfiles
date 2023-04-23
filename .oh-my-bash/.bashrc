if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# PROMPT
force_color_prompt=yes
green='\033[0;32m'
yellow='\033[0;33m'
nc='\033[0m'

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1="${green}\u${nc}@\h [ \W ] \$(parse_git_branch) $ "

# ALIASES
alias ls='ls -Gp'
alias la='ls -Ga'

alias fe='open $(pwd)'

alias gst='git status'
alias gl='git log'
alias ldd='otool -L'
alias code='/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Electron'
alias ghidra='/Users/roar/fun/software/ghidra_10.2.2/ghidraRun 1>/dev/null 2>&1 &; disown '
alias mci='mvn clean install'
alias mcc='mvn clean compile'
alias mct='mvn clean test'

# HISTORY 
# export PROMPT_COMMAND="history -a; history -n" # shared history 
shopt -s histverify # don't execute command before editing when using !n

export BASH_SILENCE_DEPRECATION_WARNING=1;
export EDITOR='vim'
export PAGER='less'
export GIT_PAGER='less'

export MVN_HOME="/Users/roar/fun/software/apache-maven-3.8.1/bin"
export MAVEN_OPTS="--add-modules=ALL-SYSTEM"

export PATH="$MVN_HOME:/Users/roar/fun/git/cligpt/:/opt/homebrew/bin:$PATH"

# PRINT
printf "\n \e[1;34minterface en0:\e[0m $(ifconfig en0 | grep -o -e 'inet [0-9]\+.[0-9]\+.[0-9]\+.[0-9]\+' | awk '{print $2}')\n\n"

#sudo nmap -v  -sO 192.168.1.0/24 | tee /home/Users/roar/fun/tmp/nmap_report
#alias scan_ssh='sudo nmap -p 22 --open 192.168.1.0/24 | tee $HOME/fun/tmp/nmap_report'
#printf "\n \e[1;34mwrk\e[0m -t1 -c400 -d30s http://localhost:8080/index.html\n"
#printf "\n ssh-copy-id\n\n"

alias note='vim ~/fun/notes'
alias todo='vim ~/fun/todo'




