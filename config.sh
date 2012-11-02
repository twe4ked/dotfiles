source ~/.fresh/build/shell.sh

export DOTFILES=~/.dotfiles         # Find the this folder

# Source the dotfiles
source $DOTFILES/shell/functions.sh # Misc functions
source $DOTFILES/shell/exports.sh   # Load exports
source $DOTFILES/aliases/aliases.sh # Load all the alias files
source $DOTFILES/shell/colours.sh   # Colours

if [ -f $DOTFILES/work.sh ]; then
  source $DOTFILES/work.sh          # Work related aliases etc.
fi

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

# Ensure that rvm is the last thing sourced in all of your shell profiles,
# especially PATH are set.  Otherwise, the values you set be trampled when you
# switch rubies.
eval "$(rbenv init - | grep -v \^rbenv\ rehash)"
gem() { rbenv exec gem "$@" && rbenv rehash && hash -r; }
