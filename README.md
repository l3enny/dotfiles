This is my set of dotfiles which are managed by GNU Stow. This approach was
inspired by [this
article](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html).
In order to install the configuration files for a particular program, one need
but change to this directory and type "$ stow ${PROGRAM}. Stow will then create
all the necessary symlinks in /.. and leave you to your business. Eventually, I
hope to automate the process with script which will incorporate OS-specific
alterations.
