#!/bin/bash -e

if [ -d ~/.dotfiles ]
then
  if type -t git-up > /dev/null
  then
    (cd ~/.dotfiles && git-up)
  else
    (cd ~/.dotfiles && git pull --rebase)
  fi
else
  git clone git://github.com/twe4ked/dotfiles.git ~/.dotfiles
fi

[ -e ~/.freshrc ] || ln -sv ~/.dotfiles/config/freshrc ~/.freshrc

if [ -e ~/.fresh/build/shell.sh ]; then
  source ~/.fresh/build/shell.sh
  fresh
else
  bash -c "`curl -sL get.freshshell.com`"
fi

if ! [ -d ~/.vim/bundle/vundle ]
then
  git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

vim -N -u ~/.vimrc -s <(cat <<-EOF
:set buftype=nofile
iRun \`:qa\` to finish install when bundle completes.
:BundleClean!
:BundleInstall!
EOF
)
