#!/usr/bin/env bash

# A script to install twe4ked's dotfiles automatically.
# 
# Version: 0.3
#
# Note:
#   This file is a work in progress, it isn't well tested and doesn't have much 
#   error handling. If you find any errors or have any ideas to make this script 
#   better, let me know or fork, fix and submit a pull request.
# 
# Usage:
#   bash < <( curl http://github.com/twe4ked/dotfiles/raw/master/bin/install.sh )

if [[ -d "$HOME/.dotfiles" ]]; then
  echo "The dotfiles are already on your computer!"
  echo "Would you like to check for updates?. (y/n)"
  read answer
    if [[ $answer = "y" || $answer = "Y" || $answer = "yes" ]]; then
      cd ~/.dotfiles
      git pull origin master
    fi
else
  echo "Cloning twe4ked's dotfiles repo to ~/.dotfiles"
  cd ~/
  git clone http://github.com/twe4ked/dotfiles.git .dotfiles
  
  export DOTFILES=~/.dotfiles
  source $DOTFILES/shell/colours.sh
  
  
  echo $(colour blue)"Removing .profile and replacing with a symlink to a custom version."
  echo "Note: this is only used when using bash."
  echo "Old version will be renamed .profile.bak"$(colour reset)
  cp .profile .profile.bak
  rm .profile
  ln -s ~/.dotfiles/bash/profile .profile
  
  echo $(colour blue)"Creating .irbrc symlink"$(colour reset)
  ln -s ~/.dotfiles/lib/irbrc .irbrc
  
  # TODO: For some reason 'read' doesn't seem to work, not sure why.
  #
  # echo "Do you want to install oh-my-zsh (recommended). (y/n)"
  # read answer
    # if [[ $answer = "y" || $answer = "Y" || $answer = "yes" ]]; then
      
      # TODO: Add check for wget
      echo $(colour blue)"Installing oh-my-zsh"$(colour reset)
      wget http://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
      
      echo $(colour blue)"Creating symlink to custom oh-my-zsh theme"$(colour reset)
      cd ~/.oh-my-zsh/themes
      ln -s ~/.dotfiles/zsh/zsh-theme my.zsh-theme
      
      echo $(colour blue)"Removing .zshrc and replacing with a symlink to a custom version."$(colour reset)
      echo $(colour blue)"Old version will be renamed .zshrc.bak"$(colour reset)
      cd ~/
      cp .zshrc .zshrc.bak
      rm .zshrc
      ln -s ~/.dotfiles/zsh/zshrc .zshrc
    # fi
    
  source ~/.profile # If using bash
  source ~/.zshrc   # If using zsh
  
  echo ""
  echo $(colour green)"twe4ked's dotfiles have been installed successfully"
  echo "I reccomend you check out the ~/.dotfiles/config file and make any required adjustments."$(colour reset)
fi