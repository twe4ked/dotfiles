#!/usr/bin/env bash

# A script to install twe4ked's dotfiles automatically.
# 
# Note:
#   This file is a work in progress, it isn't well tested and doesn't have much 
#   error handling. If you find any errors or have any ideas to make this script 
#   better let me know or fork, fix and submit a pull request.
# 
# Usage:
#   bash < <( curl http://github.com/twe4ked/dotfiles/raw/master/bin/install.sh )

if [[ -d "$HOME/.dotfiles" ]]; then
  echo "The dotfiles are already on your computer!"
else
  echo "Cloning twe4ked's dotfiles repo to ~/.dotfiles"
  cd ~/
  git clone http://github.com/twe4ked/dotfiles.git .dotfiles
  
  echo "Creating .irbrc symlink"
  cd ~/
  ln -s ~/.dotfiles/lib/irbrc .irbrc # Setup .irbrc symlink
  
  # wget $1 -O $tempfile
  wget http://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
  if [[ $? != 0 ]]; then
    echo "Wget error or Wget not installed"
    # rm $tempfile
    exit
  else
    echo "Installing oh-my-zsh"
    cd ~/
  fi
  
  echo "Creating symlink to custom oh-my-zsh theme"
  cd ~/.oh-my-zsh/themes
  ln -s ~/.dotfiles/zsh/zsh-theme my.zsh-theme # Setup my.zsh-theme symlink (command must be run from ~/.oh-my-zsh/themes)
  
  echo "Removing .zshrc and replacing with a symlink to a custom version"
  echo "Old version will be renamed .zshrc.back"
  cd ~/
  cp .zshrc .zshrc.back
  rm .zshrc
  Remove @~/.zshrc@ and replace with a symlink to the custom version:
  ln -s ~/.dotfiles/zsh/zshrc .zshrc # Setup .zshrc symlink (command must be run from ~/)
fi