This is my set of dotfiles which are managed by GNU Stow. This approach was
inspired by `this article`_.  In order to install the configuration files for a
particular program, one need but type ``$ stow ${PROGRAM}``. Stow will then
create all the necessary symlinks in ``/..`` and leave you to your business.

The process is semi-automated by the use of the ``setup`` script. I am
attempting to make the installation as portable as possible (across the
\*nixes), but there is still a fair amount of work to be done.  

All changes made are purely to the software environment. Nothing is done to
alter the hardware configuration, drivers, etc. Maybe I'll write an accompanying
script for the machines I deploy on.

Software used (in addition to coreutils)
* vim
* zsh
* git
* mutt
* offlineimap
* tmux
* msmtp
* vimperator (for firefox)
* pass
* irssi
* Xorg
* awesome
* gpg
* ...

:: _`this article`:(http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html)
