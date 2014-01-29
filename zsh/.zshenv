### ZSH Environment Configuration
# These commands are run *unconditionally* for every zsh shel. As a result,
# it should be kept rather small and only limited to items which concern 
# both interactive and non-interactive sessions (primarily path and
# environment variables).

# What do you think?
export EDITOR=vim

# Include texlive binaries in path
export PATH=$PATH:/usr/local/texlive/2013/bin/x86_64-linux
# Eliminate duplicates
typeset -U PATH
