### ZSH Environment Configuration
# These commands are run *unconditionally* for every zsh shel. As a result,
# it should be kept rather small and only limited to items which concern 
# both interactive and non-interactive sessions (primarily path and
# environment variables).

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
    # Include texlive binaries in path
    export PATH=$PATH:/usr/local/texlive/2013/bin/x86_64-linux
fi
