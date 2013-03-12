#!/bin/bash -e

if [ -d ~/.dotfiles ]; then
  if type -t git-up > /dev/null; then
    (cd ~/.dotfiles && git-up)
  else
    (cd ~/.dotfiles && git pull --rebase)
  fi
else
  git clone git://github.com/twe4ked/dotfiles.git ~/.dotfiles
fi

[ -e ~/.freshrc ] || ln -sv ~/.dotfiles/freshrc ~/.freshrc

if [ -e ~/.fresh/build/shell.sh ]; then
  source ~/.fresh/build/shell.sh
  fresh
else
  bash -c "`curl -sL get.freshshell.com`"
fi
