#!/usr/bin/env bash

# Detect Arch
if [[ -f "/etc/arch-release" ]]; then
    ARCH_PRESENT=true
else
    ARCH_PRESENT=false
fi

# Detect X
if [[ `type -p X` ]]; then
    X_PRESENT=true
else
    X_PRESENT=false
fi

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
if $X_PRESENT; then
    stow xorg
fi

# Install Vundle for Vim
git clone https://github.com/gmarik/vundle.git ~/dotfiles/vim/.vim/bundle/vundle
vim -u ~/.vimrc +BundleInstall +qa
