### ZSH Environment Configuration
# These commands are run *unconditionally* for every zsh shel. As a result,
# it should be kept rather small and only limited to items which concern 
# both interactive and non-interactive sessions (primarily path and
# environment variables).

# What do you think?
export EDITOR=vim

# Eliminate duplicates
typeset -U PATH
