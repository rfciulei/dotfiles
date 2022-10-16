# oh-my-bash 

export OSH=/root/.oh-my-bash
OSH_THEME="font"
source $OSH/oh-my-bash.sh

completions=(
  git
  composer
  ssh
)

aliases=(
  general
)

plugins=(
  git
  bashmarks
)

# auto-completion
source /etc/profile.d/bash_completion.sh

# node 
alias node='cmd.exe /c node'
alias npm='cmd.exe /c npm'
alias ng='cmd.exe /c ng'
alias tsc='cmd.exe /c tsc'
alias json-server='cmd.exe /c json-server'
# java 
alias mvn='cmd.exe /c mvn'
alias java='cmd.exe /c java.exe'
alias javap='cmd.exe /c javap.exe'
alias javac='cmd.exe /c javac.exe'
alias jar='cmd.exe /c jar.exe'

# kubectl 
#alias kubectl='cmd.exe /c kubectl.exe -n andriveau-keycloak'
alias kubectl='cmd.exe /c kubectl.exe'
alias k='cmd.exe /c kubectl.exe'

# aws 
alias aws='cmd.exe /c aws.exe'

# git
alias gst='git.exe status'
alias gg="git log --graph --oneline  --pretty=format:'%h%x09%an%x09%ad%x09%s'"
alias todos='git grep -I -l TODO | xargs -n1 git blame -f -n -w | grep TODO | sed "s/.\{9\}//" | sed "s/(.*)[[:space:]]*//"'
# mvn
alias mcc='mvn clean compile'
alias mci='mvn clean install'
alias mct='mvn clean test'


# git status is slow when running from wsl in mnt
# because of wsl2 filesystem low performance
function isWinDir {
  case $PWD/ in
    /mnt/*) return $(true);;
    *) return $(false);;
  esac
}
# wrap the git command to either run windows git or linux
function git {
  if isWinDir
  then
    git.exe "$@"
  else
    /usr/bin/git "$@"
  fi
} 

# other 
alias curl="cmd.exe /c curl"
alias fe="cmd.exe /c explorer.exe ."


LS_COLORS='rs=0:di=1;35:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=01;36;40:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS
export EDITOR='vim'

cd /mnt/d/workspaces

