export DOTFILES=~/.dotfiles         # Find the this folder

# Source the dotfiles
source $DOTFILES/shell/exports.sh   # Load exports

source ~/.fresh/build/shell.sh

if [ $SHELL = "/bin/zsh" ]; then
  source $DOTFILES/zsh/config.sh
fi

eval "$(rbenv init - | grep -v \^rbenv\ rehash)"
gem() { rbenv exec gem "$@" && rbenv rehash && hash -r; }
