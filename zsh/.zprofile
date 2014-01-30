### Login ZSH configuration file
# Commands that should run at the login shell (once). Session-wide aliases,
# startup scripts, etc.

# Turn on the ssh-agent
eval $(ssh-agent)

# Pip-related settings
export PIP_REQUIRE_VIRTUALENV=true # only install in virtualenv
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache # cahce downloads

# Function to bypass restriction on global pips
syspip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# Start X
[[ -z $DISPLAY && $XDG_VNTR -eq 1 ]] && exec startx &> ~/.xlog
