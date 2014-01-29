#!/bin/sh

# Import settings
stow Xresources
stow xinitrc
stow vim
stow zsh
stow git
stow bin
stow tmux

# Install Vundle for Vim
git clone https://github.com/gmarik/vundle.git ~/dotfiles/vim/.vim/bundle/vundle
vim -u ~/.vimrc +BundleInstall +qa
