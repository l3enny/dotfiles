### Primary ZSH configuration file
# These are, for the most part, the zsh-specific configuration options which
# run for every non-login, interactive shell.

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

if [ -f "/etc/arch-release" ]; then
    # hook to search repos for missing programs
    source /usr/share/doc/pkgfile/command-not-found.zsh
fi

# local tor proxy for ssh
alias ssh-tor='ssh -o "ProxyCommand nc -X 5 -x 127.0.0.1:9050 %h %p"'

# change default behavior of mkdir to recursively create directories
# and be wordy about it
alias mkdir='mkdir -p -v'

# Make rm a bit more self-policing and to not glob per zsh
alias rm='rm -Iv --one-file-system'

# Allow aliases to carry over into sudo
alias sudo='sudo '

# MAKE PRETTY COLORS FOR ME
alias ls="ls --color=auto" 
alias grep="grep --color=auto"

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

# Enable completion for the password store
# source /etc/bash_completion.d/password-store
