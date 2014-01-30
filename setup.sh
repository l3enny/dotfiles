#!/bin/sh

# Software assumed to be present (beyond coreutils)
#
# * vim
# * zsh
# * git
# * tmux
# * OpenSSH
# * ssh-agent
# * wget (?)
# * python
# * mutt
# * offlineimap
# * mstmp
# * vimperator (for firefox)

# Import settings
stow vim
stow zsh
stow git
stow bin
stow mutt
stow offlineimap
stow tmux
stow vimperator
stow msmtp

# Test for presence of X
if [[ `type -p X` ]]
    stow xorg
fi

# Install Vundle for Vim
git clone https://github.com/gmarik/vundle.git ~/dotfiles/vim/.vim/bundle/vundle
vim -u ~/.vimrc +BundleInstall +qa
