#!/usr/bin/env bash

# A script to install (or update) twe4ked's dotfiles automatically.
#
# Version: 0.4.2
#
# Note:
#   This file is a work in progress, it isn't well tested and doesn't have much
#   error handling. If you find any errors or have any ideas to make this script
#   better, let me know or fork, fix and submit a pull request.
#
# Usage:
#   bash < <( curl https://github.com/twe4ked/dotfiles/raw/master/bin/install.sh )

if [[ -d "$HOME/.dotfiles" ]]; then
  echo "The dotfiles are already on your computer!"
  echo "Would you like to check for updates?. (y/n)"
  read answer
    if [[ $answer = "y" || $answer = "Y" || $answer = "yes" ]]; then
      cd ~/.dotfiles
      git pull origin master

      echo ""
      echo "twe4ked's dotfiles have been updated or are already at the current version!"
      echo "Any new updates will be reflected when you start your next terminal session."
    fi
else
  echo "Cloning twe4ked's dotfiles repo to ~/.dotfiles"
  cd ~/
  git clone http://github.com/twe4ked/dotfiles.git .dotfiles

  export DOTFILES=~/.dotfiles
  source $DOTFILES/shell/colours.sh

  cd $DOTFILES

  # Symlinks!
  rake

  # Source the dotfiles
  source $DOTFILES/config.sh

  echo ""
  echo $(colour green)"twe4ked's dotfiles have been installed successfully"
  echo "I recommend you check out the ~/.dotfiles/config file and make any required adjustments."$(colour reset)
fi
