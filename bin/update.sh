#!/usr/bin/env bash

# A script to update twe4ked's dotfiles automatically.
# 
# Version: 0.1
#
# Usage:
#   bash < <( curl http://github.com/twe4ked/dotfiles/raw/master/bin/update.sh )

current_path=`pwd`

echo "Updating twe4ked's dotfiles"
cd $DOTFILES
git pull origin master

echo ""
echo "twe4ked's dotfiles have been updated or are already at the current version!"
echo "Any new updates will be reflected when you start your next terminal session."

cd $current_path