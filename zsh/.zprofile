### Login ZSH configuration file
# Commands that should run at the login shell (once). Session-wide aliases,
# startup scripts, etc.

# Pip-related settings
export PIP_REQUIRE_VIRTUALENV=true # only install in virtualenv
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache # cache downloads

# Function to bypass restriction on global pips
syspip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# Start GPG and SSH keychain
eval `keychain --eval --timeout 15 --quiet --inherit local id_rsa 462BADD5`
source ~/.keychain/$HOST-sh
source ~/.keychain/$HOST-sh-gpg

# Include texlive binaries in path
export PATH=$PATH:$HOME/bin:/usr/local/texlive/2013/bin/x86_64-linux

# Start X and route errors to specified log file
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx &> ~/.xlog
