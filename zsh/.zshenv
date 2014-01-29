# What do you think?
export EDITOR=vim

# System-dependent options
if [ `uname` = "Darwin" ]; then
    export PATH=$HOME/bin                      # Personal binaries
    export PATH=$PATH:/usr/local/bin           # Homebrew binaries
    export PATH=$PATH:/usr/local/sbin          # Homebrew system binaries
    export PATH=$PATH:/usr/bin                 # User binaries come after
    export PATH=$PATH:/bin                     # Binaries
    export PATH=$PATH:/usr/sbin                # User system binaries
    export PATH=$PATH:/sbin                    # System binaries
    export PATH=$PATH:/opt/X11/bin:/usr/texbin # TeX binaries
else
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
    # Include texlive binaries in path
    export PATH=$PATH:/usr/local/texlive/2013/bin/x86_64-linux
fi
