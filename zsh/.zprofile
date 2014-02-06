### Login ZSH configuration file
# Commands that should run at the login shell (once). Session-wide aliases,
# startup scripts, etc.

# Turn on the ssh-agent
# eval $(ssh-agent)

# Pip-related settings
export PIP_REQUIRE_VIRTUALENV=true # only install in virtualenv
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache # cache downloads

# Function to bypass restriction on global pips
syspip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

eval $(keychain --eval --quiet --timeout 15 id_rsa 462BADD5)
source ~/.keychain/$HOST-sh
source ~/.keychain/$HOST-sh-gpg

# Chain start ssh-agent and X
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && ssh-agent startx &> ~/.xlog
