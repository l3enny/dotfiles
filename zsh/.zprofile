### Login ZSH configuration file
# Commands that should run at the login shell (once). Session-wide aliases,
# startup scripts, etc.

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
    # Start X
    [[ -z $DISPLAY && $XDG_VNTR -eq 1 ]] && exec startx
fi
