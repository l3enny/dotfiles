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

if [ `uname` = "Linux" ]; then
    # hook to search repos for missing programs
    source /usr/share/doc/pkgfile/command-not-found.zsh
fi
