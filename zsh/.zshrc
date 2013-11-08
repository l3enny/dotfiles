# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/ben/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Set up Path
if [ `uname` = "Darwin" ]; then
    export PATH=/usr/local/bin                 # Homebrew binaries
    export PATH=/usr/local/sbin:$PATH          # Homebrew system binaries
    export PATH=$PATH:/usr/bin                 # User binaries come after
    export PATH=$PATH:/bin                     # Binaries
    export PATH=$PATH:/usr/sbin                # User system binaries
    export PATH=$PATH:/sbin                    # System binaries
    export PATH=$PATH:/opt/X11/bin:/usr/texbin # TeX binaries
fi

# Enable online help for zsh
unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/helpfiles

# local tor proxy for ssh
alias ssh-tor='ssh -o "ProxyCommand nc -X 5 -x 127.0.0.1:9050 %h %p"'

alias ls="ls -G" # nice colored output

# Pip-related settings
export PIP_REQUIRE_VIRTUALENV=true # only install in virtualenv
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache # cahce downloads

# Function to bypass restriction on global pips
syspip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
