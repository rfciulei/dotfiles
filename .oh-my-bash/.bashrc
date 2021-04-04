# Path to your oh-my-bash installation.  
export OSH=/home/roar/.oh-my-bash
export EDITOR='nvim'

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-bash is loaded.
OSH_THEME="font"

# Which completions would you like to load? (completions can be found in ~/.oh-my-bash/completions/*)
# Custom completions may be added to ~/.oh-my-bash/custom/completions/
# Example format: completions=(ssh git bundler gem pip pip3)
# Add wisely, as too many completions slow down shell startup.
completions=(
  git
  composer
  ssh
)

# Which aliases would you like to load? (aliases can be found in ~/.oh-my-bash/aliases/*)
# Custom aliases may be added to ~/.oh-my-bash/custom/aliases/
# Example format: aliases=(vagrant composer git-avh)
# Add wisely, as too many aliases slow down shell startup.
aliases=(
  general
)

plugins=(
  git
  bashmarks
)

source $OSH/oh-my-bash.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# aliases 
alias ls="exa -s type"
alias ll="exa -als type" 
alias vim="nvim"
alias f="nautilus --browser"

# uptime
uptime -p | sed 's/^up //' | awk '{print "Uptime: "$0""}'

# for xmonad -> enable tapping and natural scrolling 
DEVICE=$(xinput list | grep -P 'Touchpad' |grep -oP '(?<=id=)\d\d')

ID_NATSCROLL=$(xinput list-props $DEVICE | grep -P 'Natural Scrolling Enabled \(' | grep -oP '\d{3}')
ID_TAPPING=$(xinput list-props $DEVICE | grep -P 'Tapping Enabled \(' | grep -oP '\d{3}')

$(xinput set-prop $DEVICE $ID_NATSCROLL 1)
$(xinput set-prop $DEVICE $ID_TAPPING 1)

