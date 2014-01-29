
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

# Enable online help for zsh
#unalias run-help
#autoload run-help
#HELPDIR=/usr/local/share/zsh/helpfiles

# local tor proxy for ssh
alias ssh-tor='ssh -o "ProxyCommand nc -X 5 -x 127.0.0.1:9050 %h %p"'

# Pip-related settings
export PIP_REQUIRE_VIRTUALENV=true # only install in virtualenv
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache # cahce downloads

# Function to bypass restriction on global pips
syspip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# System-dependent options
if [ `uname` = "Darwin" ]; then
    alias ls="ls -G"                           # nice colored output
else
    alias ls="ls --color=auto"                 # nice colored output
    # colored output for man using less
    man() {
        env LESS_TERMCAP_mb=$'\E[01;31m' \
        LESS_TERMCAP_md=$'\E[01;38;5;74m' \
        LESS_TERMCAP_me=$'\E[0m' \
        LESS_TERMCAP_se=$'\E[0m' \
        LESS_TERMCAP_so=$'\E[38;5;246m' \
        LESS_TERMCAP_ue=$'\E[0m' \
        LESS_TERMCAP_us=$'\E[04;38;5;146m' \
        man "$@"
    }
    # hook to search repos for missing programs
    source /usr/share/doc/pkgfile/command-not-found.zsh
fi
