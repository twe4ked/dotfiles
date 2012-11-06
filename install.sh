#!/bin/bash -e

cd
[ -d .dotfiles ] || git clone git://github.com/twe4ked/dotfiles.git .dotfiles

[ -e ~/.freshrc ] || ln -sv ~/.dotfiles/config/freshrc ~/.freshrc

if [ -e ~/.fresh/build/shell.sh ]; then
  source ~/.fresh/build/shell.sh
  fresh
else
  bash -c "`curl -sL get.freshshell.com`"
fi
