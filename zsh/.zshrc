# What do you think?
export EDITOR=vim

# But ZSH's implementation is annoying
bindkey -e

# History file config
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_DUPS

# Allow for non-cd directory changing
setopt autocd

# Enable prompt customization
autoload -U promptinit
promptinit
prompt redhat

# Enable auto-completion
autoload -Uz compinit
compinit -C
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Set up Path
if [ `uname` = "Darwin" ]; then
    export PATH=$HOME/bin                      # Personal binaries
    export PATH=$PATH:/usr/local/bin           # Homebrew binaries
    export PATH=$PATH:/usr/local/sbin          # Homebrew system binaries
    export PATH=$PATH:/usr/bin                 # User binaries come after
    export PATH=$PATH:/bin                     # Binaries
    export PATH=$PATH:/usr/sbin                # User system binaries
    export PATH=$PATH:/sbin                    # System binaries
    export PATH=$PATH:/opt/X11/bin:/usr/texbin # TeX binaries
    alias ls="ls -G"                           # nice colored output
else
    alias ls="ls --color=auto"                 # nice colored output
fi

# Enable online help for zsh
unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/helpfiles

# local tor proxy for ssh
alias ssh-tor='ssh -o "ProxyCommand nc -X 5 -x 127.0.0.1:9050 %h %p"'


# Pip-related settings
export PIP_REQUIRE_VIRTUALENV=true # only install in virtualenv
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache # cahce downloads

# Function to bypass restriction on global pips
syspip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
