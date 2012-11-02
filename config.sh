source ~/.fresh/build/shell.sh

export DOTFILES=~/.dotfiles         # Find the this folder

# Source the dotfiles
source $DOTFILES/shell/functions.sh # Misc functions
source $DOTFILES/shell/exports.sh   # Load exports

if [ $SHELL = "/bin/zsh" ]; then
  source $DOTFILES/zsh/config.sh
fi

# Set Apple Terminal.app resume directory
# http://superuser.com/questions/313650/resume-zsh-terminal-os-x-lion/315029#315029
if [[ $TERM_PROGRAM == "Apple_Terminal" ]] && [[ -z "$INSIDE_EMACS" ]] {
  function chpwd {
    local SEARCH=' '
    local REPLACE='%20'
    local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
    printf '\e]7;%s\a' $PWD_URL
  }
  chpwd
}

eval "$(rbenv init - | grep -v \^rbenv\ rehash)"
gem() { rbenv exec gem "$@" && rbenv rehash && hash -r; }
