#!/bin/bash -e

cd
[ -d .dotfiles ] || git clone git://github.com/twe4ked/dotfiles.git .dotfiles

function create_link()
{
  local SRC="$1"
  local DST="$2"

  if [ ! -e "$DST" ]
  then
    ln -sv "$SRC" "$DST"
  else
    if [ ! -L "$DST" ] || [ "`readlink "$DST"`" != "$SRC" ]
    then
      echo -n "dotfiles: $DST already exists" >&2
      if [ -L "$DST" ]
      then
        echo " (pointing to `readlink "$DST"`)"
      else
        echo " (not a symlink)"
      fi
    fi
  fi
}

mkdir -p ~/.vim

create_link ~/.dotfiles/zsh/zshrc   ~/.zshrc
create_link ~/.dotfiles/lib/freshrc ~/.freshrc
create_link ~/.dotfiles/vim/gvimrc  ~/.gvimrc
create_link ~/.dotfiles/vim/vimrc   ~/.vimrc
create_link ~/.dotfiles/vim/colors/ ~/.vim/colors

if [ -e ~/.fresh/build/shell.sh ]; then
  source ~/.fresh/build/shell.sh
  fresh
else
  bash -c "`curl -sL get.freshshell.com`"
fi
