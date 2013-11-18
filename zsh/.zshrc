# History file config
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Allow for non-cd directory changing
setopt autocd

# Enable auto-completion
autoload -Uz compinit
compinit

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
    alias ls="ls --color=auto"                 # nic colored output
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
