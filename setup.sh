#!/bin/sh

if [ `uname` = "Darwin" ]; then
    echo "Warning: be sure to install the XCode Command Line Tools!"
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
    
    # Update Homebrew
    brew update
    
    # Install desired software
    brew install vim
    brew install tmux
    brew install zsh
    brew install pass
    brew install python
    brew install python3
    brew install mutt
    brew install irssi
    brew install gpg
    brew install git
    
    # Install Vundle for Vim
    git clone https://github.com/gmarik/vundle.git ~/dotfiles/vim/.vim/bundle/vundle
fi

vim -u ~/.vimrc.bundles +BundleInstall +qa